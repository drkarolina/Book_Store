class OrderItemsService
  attr_reader :order

  def initialize(params, order)
    @order = order
    @params = params
  end

  def call
    return unless valid_quantity?

    order_item ? update_order_item : create_order_item
  end

  def valid_quantity?
    Book.find(@params[:book_id]).quantity >= @params[:quantity].to_i && @params[:quantity].to_i >= 1
  end

  def order_item
    @order_item ||= order.order_items.find_by(book: @params[:book_id])
  end

  def update_order_item
    @order_item.quantity = @params[:quantity].to_i
    @order_item.save
  end

  def create_order_item
    @order.order_items.create(@params).save
  end
end
