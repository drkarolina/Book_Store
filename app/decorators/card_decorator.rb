class CardDecorator < Draper::Decorator
  delegate_all

  def hidden_card_number
    number.gsub!(/.(?=....)/, Constants::HIDDEN_NUMBER)
  end
end
