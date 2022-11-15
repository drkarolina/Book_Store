module Checkout
  class DeliveryService
    def initialize(params, user, order)
      @params = params
      @user = user
      @order = order
    end

    def call
      return false unless @params[:delivery_id]

      @order.update(delivery: Delivery.find(@params[:delivery_id]))
      true
    end

    def presenter; end
  end
end
