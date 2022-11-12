module Checkout
  class UpdateService
    attr_reader :presenter

    SERVICES = {
      address: Checkout::AddressService
    }.freeze

    def initialize(params, user, order)
      @params = params
      @user = user
      @order = order
    end

    def call
      service = SERVICES[@params[:step].to_sym].new(@params, @user)
      return true if service.call

      @presenter = service.presenter
      false
    end

    def next_step
      switch_step
      @order.status
    end

    private

    def switch_step
      case @params[:step].to_sym
      when :address
        @order.delivery!
      when :delivery
        @order.payment!
      when :payment
        @order.confirm!
      when :confirm
        @confirm.complete!
      end
    end
  end
end
