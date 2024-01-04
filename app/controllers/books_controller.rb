class BooksController < ApplicationController
  def index
    @collection, book_count = BooksFilter.new(params).call
    @books = @collection.limit(book_count)
  end

  def show
    @book = Book.find(params[:id]).decorate
    @reviews = @book.reviews.includes(:user).approved.decorate
  end
end
