require 'rails_helper'

RSpec.describe 'BooksQuery' do
  let(:books) { Book.all }

  describe 'BooksQuery#call' do
    context 'when filtering without sorting' do
      it 'returns books with specific category sorted by title' do
        result = books.joins(:categories).where('categories.id': 1).order('title ASC')
        expect(BooksQuery.new({ category_id: 1 }).call).to eq(result)
      end
    end

    context 'when sorting without filtering' do
      it 'returns books in specific order' do
        expect(BooksQuery.new({ sort_by: 'price_asc' }).call).to eq(books.order('price ASC'))
      end
    end

    context 'when sorting and filtering' do
      it 'returns books with specific category in specific order' do
        result = books.joins(:categories).where('categories.id': 1).order('title ASC')
        expect(BooksQuery.new({ category_id: 1, sort_by: 'title_asc' }).call).to eq(result)
      end
    end

    context 'when neither sorting nor filtering' do
      it 'returns all books sorted by title' do
        expect(BooksQuery.new({}).call).to eq(books.order('title ASC'))
      end
    end
  end
end
