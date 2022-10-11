require_relative '../queries/books_query'
class BooksController < ApplicationController
  MAX_BOOKS_ON_PAGE = 8
  def index
    books = Book.includes(:authors).all.decorate
    @collection = BooksQuery.new(books, params[:category_id], params[:sort_by]).filter_and_sort
    @books = @collection.limit(current_books_count)
  end

  def show
    @book = Book.includes(:authors).find(params[:id]).decorate
  end

  def current_books_count
    params[:current_books_count].nil? ? MAX_BOOKS_ON_PAGE : params[:current_books_count].to_i + MAX_BOOKS_ON_PAGE
  end
end
