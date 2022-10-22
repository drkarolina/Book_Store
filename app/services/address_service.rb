class AddressService
  attr_reader :errors

  def initialize(user, params)
    @user = user
    @form = AddressForm.new(params)
    @params = params.merge(addressable: user)
  end

  def call
    @form.valid? ? manage_address : collect_errors
  end

  private

  def collect_errors
    @errors = @form.errors || {}
    @errors.blank?
  end

  def manage_address
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
