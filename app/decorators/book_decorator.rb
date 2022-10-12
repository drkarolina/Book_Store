require_relative '../constants/constants'
class BookDecorator < Draper::Decorator
  delegate_all
  def authors_full_name
    object.authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def price_in_euro
    "€#{object.price}"
  end

  def dimensions
    "H: #{object.height}\" x W: #{object.width}\" x D: #{object.depth}"
  end

  def more_description?
    object.description.length > SHORT_DESCRIPTION_LENGTH
  end
end
