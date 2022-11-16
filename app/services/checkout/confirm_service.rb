module Checkout
  class ConfirmService
    def initialize(_params, user, order)
      @user = user
      @order = order
    end

    def call
      @order.update(number: generate_order_number)
      OrderMailer.order_confirmation(@user.email, @order.number).deliver_later
    end

    def presenter; end

    private

    def generate_order_number
      "R#{Array.new(8) { rand(0..9) }.join}"
    end
  end
end
