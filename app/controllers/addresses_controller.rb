class AddressesController < ApplicationController
  before_action :authenticate_user!

  def create
    address_service = AddressService.new(current_user, address_params)
    return redirect_to(settings_path, notice: t('.success')) if address_service.confirm_form

    @settings_service = SettingsService.new(current_user, address_params, address_service.errors)
    render 'settings/index'
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name,
                                    :address, :address_type,
                                    :city, :zip, :country, :phone)
  end
end
