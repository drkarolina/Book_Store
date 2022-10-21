class AddressForm
  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :address, :city, :zip_code, :country, :phone, :address_type

  validates :first_name, :last_name, :address, :city, :zip_code, :country, :phone, presence: true
  validates :first_name, :last_name, :country, :city, length: { maximum: Constants::NAME_MAX_SIZE },
                                                      format: { with: Constants::VALIDATE_NAME,
                                                                message: I18n.t('addresses.validation.names_format') }
  validates :address, length: { maximum: Constants::ADDRESS_MAX_SIZE },
                      format: { with: Constants::VALIDATE_ADDRESS,
                                message: I18n.t('addresses.validation.address_format') }
  validates :phone, length: { maximum: Constants::PHONE_MAX_SIZE },
                    format: { with: Constants::VALIDATE_PHONE,
                              message: I18n.t('addresses.validation.phone_format') }
  validates :zip_code, length: { maximum: Constants::ZIP_MAX_SIZE },
                       format: { with: Constants::VALIDATE_ZIP,
                                 message: I18n.t('addresses.validation.zip_format') }

  validate :country_selected_from_list, unless: -> { country.blank? }
  validate :country_code_of_phone, unless: -> { phone.blank? }

  private

  def country_selected_from_list
    errors.add(:country, :invalid) unless selected_country
  end

  def country_code_of_phone
    return if country.present? && phone.include?(selected_country.country_code)

    errors.add(:phone, I18n.t('addresses.validation.phone_country_code'))
  end

  def selected_country
    ISO3166::Country.find_country_by_name(country)
  end
end
