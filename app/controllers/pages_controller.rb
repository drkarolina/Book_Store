class PagesController < ApplicationController
  def index
    @newest_books = BookDecorator.decorate_collection(newest_books)
    @best_sellers = BookDecorator.decorate_collection(best_sellers)
  end

  private

  def newest_books
    Book.order('published_at DESC').first(Constants::NUMBER_OF_NEWEST_BOOKS)
  end

  def best_sellers
    OrderItem.group(:book).count.sort_by { |_k, v| -v }.map(&:first).first(Constants::NUMBER_OF_BEST_SELLERS)
  end
end
