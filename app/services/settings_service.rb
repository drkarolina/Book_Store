class SettingsService
  def initialize(user, params = {}, address_errors = {})
    @user = user
    @params = params
    @address_errors = address_errors
  end

  def billing_address
    @user.billing_address || new_address(:billing_address)
  end

  def shipping_address
    @user.shipping_address || new_address(:shipping_address)
  end

  def billing_errors
    check_errors(:billing_address)
  end

  def shipping_errors
    check_errors(:shipping_address)
  end

  def countries
    @countries ||= ISO3166::Country.all
  end

  private

  def check_errors(address_type)
    @address_errors if @params[:address_type] == address_type.to_s
  end

  def new_address(address_type)
    @params[:address_type] == address_type.to_s ? Address.new(@params) : Address.new
  end
end
