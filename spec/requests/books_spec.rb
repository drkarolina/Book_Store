require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET /books' do
    before { get books_path }

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET /books/[:id]' do
    before { get books_path(0) }

    it { expect(response).to have_http_status(:ok) }
  end
end
