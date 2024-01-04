require 'rails_helper'

RSpec.describe 'BooksFilter' do
  let(:books) { Book.all }

  describe 'BooksFilter#call' do
    context 'when filtering without sorting' do
      let(:book_count) { 8 }
      let(:params) { { category_id: 1 } }
      let(:result) { books.joins(:categories).where('categories.id': 1).order('title ASC') }

      it 'returns books with specific category sorted by title' do
        expect(BooksFilter.new(params).call[0]).to eq(result)
      end

      it 'returns books_count eq 8' do
        expect(BooksFilter.new(params).call[1]).to eq(book_count)
      end
    end

    context 'when sorting without filtering' do
      let(:book_count) { 8 }
      let(:params) { { sort_by: 'price_asc' } }
      let(:result) { books.order('price ASC') }

      it 'returns books in specific order' do
        expect(BooksFilter.new(params).call[0]).to eq(result)
      end

      it 'returns books_count eq 8' do
        expect(BooksFilter.new(params).call[1]).to eq(book_count)
      end
    end

    context 'when sorting and filtering' do
      let(:book_count) { 8 }
      let(:params) { { category_id: 1, sort_by: 'title_asc' } }
      let(:result) { books.joins(:categories).where('categories.id': 1).order('title ASC') }

      it 'returns books with specific category in specific order' do
        expect(BooksFilter.new(params).call[0]).to eq(result)
      end

      it 'returns books_count eq 8' do
        expect(BooksFilter.new(params).call[1]).to eq(book_count)
      end
    end

    context 'when neither sorting nor filtering' do
      let(:book_count) { 8 }
      let(:params) { {} }
      let(:result) { books.order('title ASC') }

      it 'returns all books sorted by title' do
        expect(BooksFilter.new(params).call[0]).to eq(result)
      end

      it 'returns books_count eq 8' do
        expect(BooksFilter.new(params).call[1]).to eq(book_count)
      end
    end

    context 'when there are 8 books on a page' do
      let(:book_count) { 16 }
      let(:params) { { current_books_count: 8 } }

      it 'returns books_count eq 16' do
        expect(BooksFilter.new(params).call[1]).to eq(book_count)
      end
    end
  end
end
