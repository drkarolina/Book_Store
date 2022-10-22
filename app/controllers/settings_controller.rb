class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @settings_service = SettingsService.new(current_user)
  end
end
