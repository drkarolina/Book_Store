class OrdersService
  attr_accessor :cookies
  attr_reader :user

  def initialize(user, cookies, params)
    @user = user
    @cookies = cookies
    @params = params
  end

  def call
    return Order.find_by(id: cookies[:order_id]) if user.blank? && cookies[:order_id].present?
    return order_find_by_status if user && order_find_by_status.present?

    create_order(user&.id)
  end

  private

  def create_order(user_id)
    order = Order.create(user_id: user_id)
    cookies[:order_id] = order.id unless user_id
    order
  end

  def order_find_by_status
    Order.includes(order_items: [:book]).where('status < ?', Order.statuses[:complete]).find_by(user: user)
  end
end
