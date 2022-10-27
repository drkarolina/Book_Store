module Users
  class UserDataController < Devise::RegistrationsController
    before_action :authenticate_user!

    def update
      update_result = account_update_params[:email] ? update_email : update_resource(resource, account_update_params)
      update_result ? successful_response : fail_response
    end

    private

    def update_email
      current_user.skip_confirmation!
      current_user.skip_reconfirmation!
      current_user.update(account_update_params)
    end

    def successful_response
      set_flash_message_for_update(resource, resource.unconfirmed_email)
      bypass_sign_in(resource, scope: resource_name)
      respond_with(resource, location: settings_path)
    end

    def fail_response
      flash.alert = t('devise.registrations.update.alert')
      @settings_service = SettingsService.new(resource)
      render 'settings/index'
    end
  end
end
