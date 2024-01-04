require 'rails_helper'

RSpec.describe 'BookDecorator' do
  let(:books) { BookDecorator.decorate_collection(Book.includes(:authors).all) }
  let(:authors) do
    "#{books[0].authors[0].first_name} #{books[0].authors[0].last_name}, " \
      "#{books[0].authors[1].first_name} #{books[0].authors[1].last_name}"
  end

  describe 'BooksController#authors_full_name' do
    it { expect(books[0].authors_full_name).to eq(authors) }
  end

  describe 'BooksController#dimensions' do
    it { expect(books[0].dimensions).to eq("H: #{books[0].height}\" x W: #{books[0].width}\" x D: #{books[0].depth}") }
  end

  describe 'BooksController#short_description' do
    it { expect(books[0].short_description).to eq(books[0].description.truncate(Constants::SHORT_DESCRIPTION_LENGTH)) }
  end
end
