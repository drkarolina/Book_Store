class BooksController < ApplicationController
  def index
    @collection = BooksFilter.new(params).call
    @books = @collection.limit(BooksCount.current_books_count(params))
  end

  def show
    @book = Book.find(params[:id]).decorate
  end
end
