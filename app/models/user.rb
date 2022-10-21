class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[facebook]

  has_one :billing_address, -> { where(address_type: Address.address_type[:billing_address]) },
          class_name: 'Address', as: :addressable, dependent: :destroy, inverse_of: :addressable
  has_one :shipping_address, -> { where(address_type: Address.address_type[:shipping_address]) },
          class_name: 'Address', as: :addressable, dependent: :destroy, inverse_of: :addressable

  validates :email, :password, :encrypted_password, presence: true
  validates :password, format: { with: Constants::PASSWORD_FORMAT }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end
