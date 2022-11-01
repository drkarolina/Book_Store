require 'rails_helper'

RSpec.describe Admin::ReviewsController, type: :controller do
  let!(:admin_user) { create(:admin_user) }
  let!(:review) { create(:review) }
  let(:page) { Capybara::Node::Simple.new(response.body) }

  render_views

  before do
    sign_in admin_user
  end

  context 'when renders the index page' do
    let(:show_path) { send(:admin_review_path, review) }
    let(:edit_path) { send(:edit_admin_review_path, review) }

    before { get :index }

    it { expect(page).to have_content('Reviews') }
    it { expect(page).to have_link(review.id, href: show_path) }
    it { expect(page).to have_link(href: edit_path) }
    it { expect(page).to have_content(review.title) }
    it { expect(page).to have_content(review.text) }
    it { expect(page).to have_content(review.rating) }
    it { expect(page).to have_content(review.status) }
    it { expect(page).to have_content(review.user) }
    it { expect(page).to have_content(review.book.title) }
    it { expect(page).to have_content(review.created_at.strftime('%B %d, %Y')) }
    it { expect(page).to have_content(review.updated_at.strftime('%B %d, %Y')) }
  end

  context 'when renders the show page' do
    before { get :show, params: { id: review.to_param } }

    it { expect(page).to have_content('Edit Review') }
    it { expect(page).to have_content(review.title) }
    it { expect(page).to have_content(review.text) }
    it { expect(page).to have_content(review.rating) }
    it { expect(page).to have_content(review.status) }
    it { expect(page).to have_content(review.user) }
    it { expect(page).to have_content(review.book.title) }
    it { expect(page).to have_content(review.created_at.strftime('%B %d, %Y')) }
    it { expect(page).to have_content(review.updated_at.strftime('%B %d, %Y')) }
  end
end
