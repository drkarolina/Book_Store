class OrderFilterService
  def initialize(user, params)
    @user = user
    @params = params[:filter_by]
  end

  def call
    OrderDecorator.decorate_collection(find_order)
  end

  private

  def find_order
    @params ? @user.orders.where(status: @params) : @user.orders.complete
  end
end
