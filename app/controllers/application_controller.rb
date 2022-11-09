class ApplicationController < ActionController::Base
  before_action :current_order

  def current_order
    @current_order ||= OrdersService.new(current_user, cookies).call
  end
end
