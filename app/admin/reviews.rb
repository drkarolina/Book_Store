ActiveAdmin.register Review do
  permit_params :title, :text, :rating, :status, :user_id, :book_id
  controller { actions :show, :index, :cancel, :edit, :update }
  form do |f|
    f.inputs do
      f.input :title, input_html: { disabled: true }, label: I18n.t('review.field.title')
      f.input :text, input_html: { disabled: true }, label: I18n.t('review.field.text')
      f.input :rating, input_html: { disabled: true }, label: I18n.t('review.field.rating')
      f.input :status, label: I18n.t('review.field.status')
      f.input :user, as: :select, collection: User.all, input_html: { disabled: true },
                     label: I18n.t('review.field.user')
      f.input :book, input_html: { disabled: true }, label: I18n.t('review.field.book')
    end
    actions
  end
end
