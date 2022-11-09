class CouponsService
  def initialize(params, order)
    @params = params
    @order = order
  end

  def call
    return if invalid_coupon

    @coupon.update(order: @order)
  end

  private

  def current_coupon
    @coupon = Coupon.find_by(code: @params[:code])
  end

  def invalid_coupon
    return true unless current_coupon

    @coupon.order
  end
end
