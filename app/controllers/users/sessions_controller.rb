module Users
  class SessionsController < Devise::SessionsController
    def create
      params[:user][:checkout_login] ? checkout_login : super
    end

    private

    def checkout_login
      resource = warden.authenticate(auth_options)
      resource ? successful_response(resource) : fail_response
    end

    def successful_response(resource)
      sign_in(resource_name, resource)
      MargeOrderItemsService.new(current_user, params).call
      redirect_to(checkouts_path(step: :address), notice: I18n.t('devise.sessions.signed_in'))
    end

    def fail_response
      redirect_to(checkouts_path, alert: I18n.t('devise.errors.custom_login_failure'))
    end
  end
end
