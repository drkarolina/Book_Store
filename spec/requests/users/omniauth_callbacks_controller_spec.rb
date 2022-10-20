require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:built_user) { build(:user) }

  context 'when auth via Facebook' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    end

    let(:get_facebook) { get :facebook }

    context 'when user is new' do
      before do
        allow(User).to receive(:from_omniauth).and_return(built_user)
        get_facebook
      end

      it { expect(response).to redirect_to(new_user_registration_path) }
    end

    context 'when user exist' do
      before do
        allow(User).to receive(:from_omniauth).and_return(create(:user))
        get_facebook
      end

      it { expect(response).to redirect_to(root_path) }
    end
  end
end
