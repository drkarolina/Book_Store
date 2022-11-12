class CheckoutsController < ApplicationController
  def index
    return redirect_to checkout_login_path unless user_signed_in?

    service = Checkout::CheckoutService.new(params, current_user, current_order)
    @presenter = service.call
    @order = current_order.decorate
  end

  def update
    service = Checkout::UpdateService.new(params.permit!, current_user, current_order)
    return redirect_to checkouts_path(step: service.next_step) if service.call

    @presenter = service.presenter
    @order = current_order.decorate
    render :index
  end

  def checkout_login; end
end
