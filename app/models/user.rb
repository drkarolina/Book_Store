class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[facebook]

  has_one :billing_address, -> { where(address_type: Address.address_types[:billing_address]) },
          class_name: 'Address', as: :addressable, inverse_of: :addressable, dependent: :destroy
  has_one :shipping_address, -> { where(address_type: Address.address_types[:shipping_address]) },
          class_name: 'Address', as: :addressable, inverse_of: :addressable, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :email, :password, :encrypted_password, presence: true
  validates :password, format: { with: Constants::PASSWORD_FORMAT }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def to_s
    email
  end
end
