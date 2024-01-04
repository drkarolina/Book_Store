module Users
  class UserDataController < Devise::RegistrationsController
    before_action :authenticate_user!, only: :update

    def create
      params[:user][:quick_register] ? quick_register : super
    end

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

    def quick_register
      params[:user][:password] = params[:user][:password_confirmation] = Devise.friendly_token
      build_resource(sign_up_params)
      resource.skip_confirmation!
      resource.save ? authenticate_user : redirect_back_with_errors
    end

    def authenticate_user
      sign_up(resource_name, resource)
      MargeOrderItemsService.new(current_user, params).call
      resource.send_reset_password_instructions
      redirect_to(checkouts_path(step: :address), notice: I18n.t('devise.passwords.send_instructions'))
    end

    def redirect_back_with_errors
      redirect_back(fallback_location: checkouts_path,
                    alert: resource.errors.full_messages_for(:email).to_sentence)
    end
  end
end
