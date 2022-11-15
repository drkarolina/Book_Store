class PagesController < ApplicationController
  def index
    @newest_books = NewestBooksService.call
    @best_sellers = BestsellerService.call
  end
end
