require_relative '../queries/books_query'
class BooksController < ApplicationController
  def index
    @category_id = params[:category_id]
    @sort_by = params[:sort_by]
    books = BookDecorator.decorate_collection(Book.includes(:authors).all)
    @books = BooksQuery.new(books, @category_id, @sort_by).filter_and_sort
    @categories = Category.includes(:books).all
  end

  def show
    @book = Book.includes(:authors).find(params[:id]).decorate
  end
end
