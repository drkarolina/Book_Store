require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET /books' do
    context 'when neither sorting nor filtering' do
      before { get books_path }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when sorting' do
      before { get books_path(sorted_by: 'price_asc') }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when filtering' do
      before { get books_path(category_id: 1) }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when sorting and filtering' do
      before { get books_path(sorted_by: 'price_asc', category_id: 1) }

      it { expect(response).to have_http_status(:ok) }
    end
  end

  describe 'GET /books/[:id]' do
    before { get books_path(0) }

    it { expect(response).to have_http_status(:ok) }
  end
end
