class BookDecorator < Draper::Decorator
  delegate_all

  def authors_string
    object.authors.map { |author| author.decorate.full_name }.join(', ')
  end
end
