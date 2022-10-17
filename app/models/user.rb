class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  validates :email, :password, :encrypted_password, presence: true
  validates :password, format: { with: Constants::PASSWORD_FORMAT }

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    user || User.create!(provider: auth.provider, uid: auth.uid,
                         email: auth.info.email, password: Devise.friendly_token[0, 20])
  end
end
