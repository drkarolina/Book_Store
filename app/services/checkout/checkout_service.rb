module Checkout
  class CheckoutService
    PRESENTERS = {
      address: AddressPresenter,
      delivery: DeliveryPresenter
    }.freeze

    def initialize(params, user, order)
      @params = params
      @user = user
      @order = order
    end

    def call
      @order.address! if @order.unprocessed?
      PRESENTERS[@params[:step].to_sym].new(user: @user, params: @params)
    end
  end
end
