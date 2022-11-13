module Checkout
  class AddressService
    def initialize(params, user, _order)
      @params = params
      @user = user
      @billing_form = AddressForm.new(@params[:address][:billing_form])
      @shipping_form = AddressForm.new(@params[:address][:shipping_form])
    end

    def call
      validate_forms
      return false unless forms_valid?

      @params[:use_billing_address] ? save_with_hidden_shipping : save_addresses
      true
    end

    def presenter
      AddressPresenter.new(user: @user, params: @params, billing_form: @billing_form, shipping_form: @shipping_form)
    end

    private

    def save_addresses
      update_address(:billing_address, :billing_form)
      update_address(:shipping_address, :shipping_form)
    end

    def update_address(address_type, address_form)
      address(address_type).update(merged_params(address_type, address_form))
    end

    def merged_params(address_type, address_form)
      @params[:address][address_form].merge(addressable: @user, address_type: address_type_to_integer(address_type))
    end

    def address_type_to_integer(address_type)
      Address.address_types[address_type]
    end

    def address(address_type)
      Address.find_or_initialize_by(addressable_id: @user.id, address_type: address_type_to_integer(address_type))
    end

    def save_with_hidden_shipping
      update_address(:billing_address, :billing_form)
      update_address(:shipping_address, :billing_form)
    end

    def forms_valid?
      @params[:use_billing_address] ? @billing_form.valid? : @shipping_form.valid? && @billing_form.valid?
    end

    def validate_forms
      @billing_form.validate
      @shipping_form.validate
    end
  end
end
