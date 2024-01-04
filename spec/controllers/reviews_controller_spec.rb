require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:user) { create(:user) }
  let(:invalid_params) { { title: '', text: '', rating: 1, book_id: 1, user_id: 1 } }

  before { sign_in(user) }

  describe 'POST /reviews' do
    context 'when invalid params' do
      it 'doesn`t create review' do
        expect do
          post :create, params: { review: invalid_params }
        end.not_to change(Review, :count)
      end
    end
  end
end
