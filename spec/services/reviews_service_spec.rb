require 'rails_helper'

RSpec.describe ReviewsService do
  let(:user) { create(:user) }
  let(:valid_params) { { title: FFaker::Book.title, text: FFaker::Lorem.paragraph, rating: 1, book_id: 1, user_id: 1 } }
  let(:invalid_params) { { title: '', text: '', rating: 1, book_id: 1, user_id: 1 } }

  describe '#call' do
    context 'with valid params' do
      it 'returns true' do
        expect(described_class.new(valid_params).call).to be true
      end
    end

    context 'with invalid params' do
      it 'returns false' do
        expect(described_class.new(invalid_params).call).to be false
      end
    end
  end
end
