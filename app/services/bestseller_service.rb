class BestsellerService
  class << self
    def call
      BookDecorator.decorate_collection(best_sellers)
    end

    private

    def best_sellers
      OrderItem.group(:book).count.sort_by { |_k, v| -v }.map(&:first).first(Constants::NUMBER_OF_BEST_SELLERS)
    end
  end
end
