require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let!(:admin_user) { create(:admin_user) }
  let!(:category) { create(:category) }
  let(:page) { Capybara::Node::Simple.new(response.body) }

  render_views

  before do
    sign_in admin_user
  end

  context 'when renders the index page' do
    let(:show_path) { send(:admin_category_path, category) }
    let(:edit_path) { send(:edit_admin_category_path, category) }

    before { get :index }

    it { expect(page).to have_content('Categories') }
    it { expect(page).to have_link(category.id, href: show_path) }
    it { expect(page).to have_link(href: edit_path) }
    it { expect(page).to have_link(href: new_admin_category_path) }
    it { expect(page).to have_content(category.name) }
  end

  context 'when renders the show page' do
    before { get :show, params: { id: category.to_param } }

    it { expect(page).to have_content('Edit Category') }
    it { expect(page).to have_content('Delete Category') }
    it { expect(page).to have_content(category.name) }
  end

  context 'when create' do
    it 'creates category' do
      expect do
        post :create, params: { category: { name: FFaker::Lorem.word } }
      end.to change(Category, :count).by(1)
    end
  end

  context 'when delete' do
    it 'deletes category' do
      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(-1)
    end
  end
end
