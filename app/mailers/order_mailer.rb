class OrderMailer < ApplicationMailer
  def order_confirmation(email, order_number)
    mail(to: email, body: I18n.t('order_mailer.order_confirmation', order_number: order_number))
  end
end
