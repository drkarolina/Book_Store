class BooksController < ApplicationController
  def index
    @books = BookDecorator.decorate_collection(Book.includes(:authors).all.order(title: :asc))
    @categories = Category.includes(:books).all
  end
end
