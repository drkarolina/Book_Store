class CheckoutController < ApplicationController
  def index
    redirect_to checkout_login_path unless user_signed_in?
  end

  def checkout_login; end
end
