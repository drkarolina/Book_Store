module Checkout
  class CheckoutService
    def initialize(params, user, order)
      @params = params
      @user = user
      @order = order
    end

    def call
      @order.address! if @order.unprocessed?
      Constants::PRESENTERS[@params[:step].to_sym].new(user: @user, params: @params)
    end
  end
end
