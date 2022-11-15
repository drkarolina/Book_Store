class PagesController < ApplicationController
  def index
    @newest_books = BookDecorator.decorate_collection(newest_books)
  end

  private

  def newest_books
    Book.order('published_at DESC').first(Constants::NUMBER_OF_NEWEST_BOOKS)
  end
end
