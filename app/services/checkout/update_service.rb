module Checkout
  class UpdateService
    attr_reader :presenter

    SERVICES = {
      address: Checkout::AddressService,
      delivery: Checkout::DeliveryService,
      payment: Checkout::CardService
    }.freeze

    def initialize(params, user, order)
      @params = params
      @user = user
      @order = order
    end

    def call
      service = SERVICES[@params[:step].to_sym].new(@params, @user, @order)
      return true if service.call

      @presenter = service.presenter
      false
    end

    def next_step
      switch_step if @params[:step] == @order.status
      @order.status
    end

    private

    def switch_step
      case @params[:step].to_sym
      when :address
        @order.to_delivery!
      when :delivery
        @order.payment!
      when :payment
        @order.confirmation!
      when :confirmation
        @confirm.complete!
      end
    end
  end
end
