class BookDecorator < Draper::Decorator
  delegate_all

  def authors_full_name
    object.authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def price_in_euro
    "€#{object.price}"
  end
end
