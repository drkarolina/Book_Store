require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order_item_build) { build(:order_item) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer) }
    it { is_expected.to have_db_column(:book_id).of_type(:integer) }
  end
end
