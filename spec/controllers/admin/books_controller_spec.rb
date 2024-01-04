require 'rails_helper'

RSpec.describe Admin::BooksController, type: :controller do
  let!(:admin_user) { create(:admin_user) }
  let!(:book) { create(:book) }
  let(:page) { Capybara::Node::Simple.new(response.body) }

  render_views

  before do
    sign_in admin_user
  end

  context 'when renders the index page' do
    let(:show_path) { send(:admin_book_path, book) }
    let(:edit_path) { send(:edit_admin_book_path, book) }

    before { get :index }

    it { expect(page).to have_content('Books') }
    it { expect(page).to have_link(book.id, href: show_path) }
    it { expect(page).to have_link(href: edit_path) }
    it { expect(page).to have_link(href: new_admin_book_path) }
    it { expect(page).to have_content(book.id) }
    it { expect(page).to have_content(book.title) }
    it { expect(page).to have_content(book.description.truncate(Constants::SHORT_DESCRIPTION_LENGTH)) }
    it { expect(page).to have_content(book.price) }
    it { expect(page).to have_content(I18n.t('book.field.preview_image')) }
  end

  context 'when renders the show page' do
    before { get :show, params: { id: book.to_param } }

    it { expect(page).to have_content('Delete Book') }
    it { expect(page).to have_link('Edit Book') }
    it { expect(page).to have_content(book.title) }
    it { expect(page).to have_content(book.description) }
    it { expect(page).to have_content(book.published_at.strftime('%B %d, %Y')) }
    it { expect(page).to have_content(book.price) }
    it { expect(page).to have_content(book.height) }
    it { expect(page).to have_content(book.width) }
    it { expect(page).to have_content(book.depth) }
    it { expect(page).to have_content(book.materials) }
    it { expect(page).to have_content(book.quantity) }
    it { expect(page).to have_content(I18n.t('book.field.preview_image')) }
    it { expect(page).to have_content(I18n.t('book.field.images')) }
  end

  context 'when create' do
    let(:book_params) do
      { title: FFaker::Book.title,
        price: FFaker::Number.decimal,
        description: FFaker::Book.description,
        published_at: FFaker::Time.date,
        height: FFaker::Number.decimal,
        width: FFaker::Number.decimal,
        depth: FFaker::Number.decimal,
        materials: FFaker::Lorem.word,
        quantity: FFaker::Number.number }
    end

    it 'creates book' do
      expect do
        post :create, params: { book: book_params }
      end.to change(Book, :count).by(1)
    end
  end

  context 'when delete' do
    it 'deletes book' do
      expect do
        delete :destroy, params: { id: book.id }
      end.to change(Book, :count).by(-1)
    end
  end
end
