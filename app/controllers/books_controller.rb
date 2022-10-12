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
    return Constants::BOOKS_LOAD_NUMBER unless params[:current_books_count]

    params[:current_books_count].to_i + Constants::BOOKS_LOAD_NUMBER
  end
end
