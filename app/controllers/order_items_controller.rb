class OrderItemsController < ApplicationController
  before_action :create_item, only: %i[create update]

  def create
    redirect_back fallback_location: books_path
  end

  def update
    redirect_back fallback_location: carts_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end

  def create_item
    return flash[:notice] = t('.create_item.success') if OrderItemsService.new(order_item_params, current_order).call

    book = Book.find(order_item_params[:book_id])
    flash[:alert] = t('.create_item.fail', quantity: book.quantity, title: book.title)
  end
end
