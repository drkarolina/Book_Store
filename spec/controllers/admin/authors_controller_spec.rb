require 'rails_helper'

RSpec.describe Admin::AuthorsController, type: :controller do
  let!(:admin_user) { create(:admin_user) }
  let!(:author) { create(:author) }
  let(:page) { Capybara::Node::Simple.new(response.body) }

  render_views

  before do
    sign_in admin_user
  end

  context 'when renders the index page' do
    let(:show_path) { send(:admin_author_path, author) }
    let(:edit_path) { send(:edit_admin_author_path, author) }

    before { get :index }

    it { expect(page).to have_content('Authors') }
    it { expect(page).to have_link(author.id, href: show_path) }
    it { expect(page).to have_link(href: edit_path) }
    it { expect(page).to have_link(href: new_admin_author_path) }
    it { expect(page).to have_content(author.first_name) }
    it { expect(page).to have_content(author.last_name) }
    it { expect(page).to have_content(author.description) }
  end

  context 'when renders the show page' do
    before { get :show, params: { id: author.to_param } }

    it { expect(page).to have_content('Edit Author') }
    it { expect(page).to have_content('Delete Author') }
    it { expect(page).to have_content(author.first_name) }
    it { expect(page).to have_content(author.last_name) }
    it { expect(page).to have_content(author.description) }
  end

  context 'when create' do
    let(:author_params) do
      { first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name,
        description: FFaker::Book.description }
    end

    it 'creates author' do
      expect do
        post :create, params: { author: author_params }
      end.to change(Author, :count).by(1)
    end
  end

  context 'when delete' do
    it 'deletes author' do
      expect do
        delete :destroy, params: { id: author.id }
      end.to change(Author, :count).by(-1)
    end
  end
end
