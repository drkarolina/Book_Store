class CardDecorator < Draper::Decorator
  delegate_all

  def hidden_card_number
    number.gsub!(/.(?=....)/, '*')
  end
end
