require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order_build) { build(:order) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  end
end
