class MargeOrderItemsService
  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    order = curren_order
    old_order_items.each { |order_item| order_item.update(order: order) }
  end

  private

  def curren_order
    Order.includes(order_items: [:book]).where('status < ?',
                                               Order.statuses[:complete]).find_by(user: @user) ||
      Order.create(user: @user)
  end

  def old_order_items
    OrderItem.where(order_id: @params[:user][:order_id])
  end
end
