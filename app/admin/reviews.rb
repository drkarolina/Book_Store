ActiveAdmin.register Review do
  permit_params :title, :text, :rating, :status, :user_id, :book_id
  includes :book, :user
  actions :index, :show

  scope :unprocessed, default: true
  scope :approved
  scope :rejected

  controller do
    private

    def review
      Review.find(permitted_params[:id])
    end
  end

  index do
    selectable_column
    id_column

    column I18n.t('review.field.book'), :book
    column I18n.t('review.field.title'), :title
    column I18n.t('review.field.created_at'), :created_at
    column I18n.t('review.field.user'), :user
    column I18n.t('review.field.status'), :status
    actions
  end

  action_item :approve, only: :show do
    link_to t('links.approve'), approve_admin_review_path(review), method: :put unless review.approved?
  end

  action_item :reject, only: :show do
    link_to t('links.reject'), reject_admin_review_path(review), method: :put unless review.rejected?
  end

  member_action :approve, method: :put do
    review.update(status: :approved)
    redirect_to(admin_review_path(review))
  end

  member_action :reject, method: :put do
    review.update(status: :rejected)
    redirect_to(admin_review_path(review))
  end

  batch_action :approve, if: proc { @current_scope.scope_method != :approved } do |ids|
    batch_action_collection.find(ids).each do |review|
      review.update(status: :approved)
    end
    redirect_back(fallback_location: admin_reviews_path)
  end

  batch_action :reject, if: proc { @current_scope.scope_method != :rejected } do |ids|
    batch_action_collection.find(ids).each do |review|
      review.update(status: :rejected)
    end
    redirect_back(fallback_location: admin_reviews_path)
  end
end
