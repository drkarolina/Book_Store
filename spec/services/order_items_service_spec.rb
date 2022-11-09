require 'rails_helper'

RSpec.describe OrderItemsService do
  let(:user) { create(:user) }
  let(:order) { create(:order) }
  let(:book) { create(:book) }
  let(:valid_params) { { book_id: book.id, quantity: 1 } }
  let(:invalid_params) { { book_id: book.id, quantity: -1 } }

  describe '#call' do
    context 'with valid params' do
      it 'returns true' do
        expect(described_class.new(valid_params, order).call).to be true
      end
    end

    context 'with invalid params' do
      it 'returns nil' do
        expect(described_class.new(invalid_params, order).call).to be_nil
      end
    end
  end
end
