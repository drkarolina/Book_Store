class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = OrderFilterService.new(current_user, params).call
  end

  def show
    @order = Order.find_by(id: params[:id], user: current_user).decorate
  end
end
