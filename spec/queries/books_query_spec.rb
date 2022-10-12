require 'rails_helper'

RSpec.describe 'BooksQuery' do
  let(:books) { Book.all }

  describe 'BooksQuery#filter_and_sort' do
    context 'when filtering without sorting' do
      it 'returns books with specific category sorted by title' do
        result = books.joins(:categories).where('categories.id': 1).order('title ASC')
        expect(BooksQuery.new(books, 1, nil).filter_and_sort).to eq(result)
      end
    end

    context 'when sorting without filtering' do
      it 'returns books in specific order' do
        expect(BooksQuery.new(books, nil, 'price_asc').filter_and_sort).to eq(books.order('price ASC'))
      end
    end

    context 'when sorting and filtering' do
      it 'returns books with specific category in specific order' do
        result = books.joins(:categories).where('categories.id': 1).order('title ASC')
        expect(BooksQuery.new(books, 1, 'title_asc').filter_and_sort).to eq(result)
      end
    end

    context 'when neither sorting nor filtering' do
      it 'returns all books sorted by title' do
        expect(BooksQuery.new(books, nil, nil).filter_and_sort).to eq(books.order('title ASC'))
      end
    end
  end
end
