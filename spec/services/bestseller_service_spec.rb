require 'rails_helper'

RSpec.describe BestsellerService do
  let(:book1) { Book.find(1) }
  let(:book2) { Book.find(2) }
  let(:order) { create(:order) }

  before do
    2.times { OrderItem.create!(order: order, book: book1, quantity: 1) }
    3.times { OrderItem.create!(order: order, book: book2, quantity: 1) }
  end

  describe 'BestsellerService#call' do
    it { expect(described_class.call.first).to eq(book2) }
  end
end
