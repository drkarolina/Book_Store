class CardForm
  include ActiveModel::Model
  attr_accessor :number, :name, :month_year, :cvv, :order_id

  validates :number, :name, :month_year, :cvv, presence: true

  validates :number, format: { with: Constants::VALIDATE_CARD_NUMBER,
                               message: I18n.t('cards.validation.number') }
  validates :name, format: { with: Constants::VALIDATE_NAME_ON_CARD,
                             message: I18n.t('cards.validation.name') }
  validates :month_year, format: { with: Constants::VALIDATE_MMVV,
                                   message: I18n.t('cards.validation.mm_yy') }
  validates :cvv, format: { with: Constants::VALIDATE_CVV,
                            message: I18n.t('cards.validation.cvv') }
end
