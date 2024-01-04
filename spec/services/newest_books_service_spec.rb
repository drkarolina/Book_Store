require 'rails_helper'

RSpec.describe NewestBooksService do
  let(:newest_book) { Book.order('published_at DESC').first }

  describe 'BestsellerService#call' do
    it { expect(described_class.call.first).to eq(newest_book) }
  end
end
