class CouponsController < ApplicationController
  def update
    flash[:alert] = t('.fail') unless CouponsService.new(coupon_params, current_order).call
    redirect_back fallback_location: carts_path
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
