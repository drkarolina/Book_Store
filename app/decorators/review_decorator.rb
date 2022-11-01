class ReviewDecorator < Draper::Decorator
  delegate_all
  def reviewer_name
    address = user.billing_address
    address ? "#{address.first_name} #{address.last_name}" : user.email
  end
end
