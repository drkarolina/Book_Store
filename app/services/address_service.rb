class AddressService
  attr_reader :errors

  def initialize(user, params)
    @user = user
    @form = AddressForm.new(params)
    @params = params.merge(addressable: user)
  end

  def confirm_form
    @form.valid? ? update_address : check_errors
  end

  private

  def check_errors
    @errors = @form.errors || {}
    @errors.blank?
  end

  def update_address
    address.update(@params)
  end

  def address_type_to_integer
    Address.address_types[@params[:address_type].to_sym]
  end

  def address
    @params[:address_type] = address_type_to_integer
    Address.find_or_initialize_by(addressable_id: @user.id, address_type: @params[:address_type])
  end
end
