require 'rails_helper'

RSpec.describe 'BookDecorator' do
  let(:authors) { AuthorDecorator.decorate_collection(Author.all) }
  let(:full_name) { "#{authors[0].first_name} #{authors[0].last_name}" }

  describe 'AuthorDecorator#full_name' do
    it { expect(authors[0].full_name).to eq(full_name) }
  end
end
