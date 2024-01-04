require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /' do
    before { get root_path }

    it { expect(response).to have_http_status(:ok) }
  end
end
