require 'rails_helper'

RSpec.describe OrderMailer, type: :mailer do
  describe 'OrderMailer#order_confirmation' do
    let(:user) { build(:user) }
    let(:number) { FFaker::Number.number }
    let(:mail) { described_class.order_confirmation(user.email, number) }

    it 'renders the headers' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(I18n.t('order_mailer.order_confirmation', order_number: number))
    end
  end
end
