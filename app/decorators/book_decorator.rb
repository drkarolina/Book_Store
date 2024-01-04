class BookDecorator < Draper::Decorator
  delegate_all
  def authors_full_name
    object.authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def dimensions
    "H: #{object.height}\" x W: #{object.width}\" x D: #{object.depth}"
  end

  def more_description?
    object.description.length > Constants::SHORT_DESCRIPTION_LENGTH
  end

  def short_description
    object.description.truncate(Constants::SHORT_DESCRIPTION_LENGTH)
  end
end
