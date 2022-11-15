class AddressPresenter
  def initialize(user:, params:, billing_form: nil, shipping_form: nil)
    @user = user
    @billing_form = billing_form
    @shipping_form = shipping_form
    @params = params
  end

  def countries
    ISO3166::Country.all
  end

  def billing_address
    find_addres(:billing_address) || crete_address(:billing_form)
  end

  def shipping_address
    find_addres(:shipping_address) || crete_address(:shipping_form)
  end

  def billing_errors
    @billing_errors ||= @billing_form&.errors
  end

  def shipping_errors
    @shipping_errors ||= @shipping_form&.errors
  end

  private

  def address_type_to_integer(address_type)
    Address.address_types[address_type]
  end

  def find_addres(address_type)
    Address.find_by(addressable_id: @user.id, address_type: address_type_to_integer(address_type))
  end

  def crete_address(form)
    @params[:address] ? Address.new(@params[:address][form]) : Address.new
  end
end
