class AuthorDecorator < Draper::Decorator
  delegate_all

  def full_name
    [object.first_name, object.last_name].join(' ')
  end
end
