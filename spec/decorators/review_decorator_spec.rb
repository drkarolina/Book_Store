require 'rails_helper'

RSpec.describe 'ReviewDecorator' do
  let(:review) { build(:review).decorate }

  describe '#reviewer_name' do
    let(:reviewer_nameresult) { review.user.email }

    it 'returns default username' do
      expect(review.reviewer_name).to eq(reviewer_nameresult)
    end
  end
end
