Devise.setup do |config|
  config.omniauth :facebook, Rails.application.credentials.dig(:facebook, :APP_ID).to_s,
  Rails.application.credentials.dig(:facebook, :APP_SECRET).to_s, scope: 'email,public_profile', info_fields: 'email'
  
  config.mailer_sender = 'bookstore.karolina@gmail.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
