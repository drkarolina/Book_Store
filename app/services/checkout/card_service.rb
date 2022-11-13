module Checkout
  class CardService
    def initialize(params, user, order)
      @params = params
      @user = user
      @order = order
      @form = CardForm.new(@params[:card])
    end

    def call
      @form.validate
      return false unless @form.valid?

      update_card
      true
    end

    def presenter
      CardPresenter.new(user: @user, params: @params, form: @form)
    end

    private

    def update_card
      card.update(@params[:card].merge(order: @order))
    end

    def card
      Card.find_or_initialize_by(order_id: @order.id)
    end
  end
end
