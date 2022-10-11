require_relative '../queries/books_query'
class BooksController < ApplicationController
  def index
    books = Book.includes(:authors).all.decorate
    @books = BooksQuery.new(books, params[:category_id], params[:sort_by]).filter_and_sort
    @categories = Category.includes(:books).all
  end

  def show
    @book = Book.includes(:authors).find(params[:id]).decorate
  end

  def book_params
    params.permit(:id, :category_id, :sort_by, :current_books_count)
  end
end
