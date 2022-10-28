ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column I18n.t('admin_user.field.email'), :email
    column I18n.t('admin_user.field.current_sign_in_at'), :current_sign_in_at
    column I18n.t('admin_user.field.sign_in_count'), :sign_in_count
    column I18n.t('admin_user.field.created_at'), :created_at
    actions
  end

  filter :email, label: I18n.t('admin_user.field.email')
  filter :current_sign_in_at, label: I18n.t('admin_user.field.current_sign_in_at')
  filter :sign_in_count, label: I18n.t('admin_user.field.sign_in_count')
  filter :created_at, label: I18n.t('admin_user.field.created_at')

  form do |f|
    f.inputs do
      f.input :email, label: I18n.t('admin_user.field.email')
      f.input :password, label: I18n.t('admin_user.field.password')
      f.input :password_confirmation, label: I18n.t('admin_user.field.password_confirmation')
    end
    f.actions
  end
end
