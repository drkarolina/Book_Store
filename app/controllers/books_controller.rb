require_relative '../queries/books_query'
require_relative '../constants/constants'
class BooksController < ApplicationController
  def index
    @collection = BooksQuery.new(params).call
    @books = @collection.limit(current_books_count)
  end

  def show
    @book = Book.find(params[:id]).decorate
  end

  private

  def current_books_count
    params[:current_books_count] ? params[:current_books_count].to_i + BOOKS_LOAD_NUMBER : BOOKS_LOAD_NUMBER
  end
end
