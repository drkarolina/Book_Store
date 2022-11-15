class CompletePresenter
  attr_reader :completed_order

  def initialize(user:, params: nil)
    @user = user
    @params = params
    @completed_order = @user.orders.complete.last.decorate
  end
end
