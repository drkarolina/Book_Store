class CartsController < ApplicationController
  def index
    @order = current_order.decorate
  end
end
