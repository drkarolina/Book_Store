class CardPresenter
  def initialize(user:, params:, form: nil)
    @user = user
    @params = params
    @form = form
  end

  def card
    current_order.card || create_card
  end

  def card_errors
    @card_errors ||= @form&.errors
  end

  private

  def current_order
    Order.includes(order_items: [:book]).where('status < ?', Order.statuses[:complete]).find_by(user: @user)
  end

  def create_card
    @params[:card] ? Card.new(@params[:card]) : Card.new
  end
end
