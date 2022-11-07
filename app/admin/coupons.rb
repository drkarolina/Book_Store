ActiveAdmin.register Coupon do
  permit_params :code, :discount

  index do
    selectable_column
    id_column

    column I18n.t('coupon.field.code'), :code
    column I18n.t('coupon.field.discount'), :discount
    column I18n.t('coupon.field.is_valid'), :is_valid
    actions
  end

  form do |f|
    f.inputs do
      f.input :code, label: I18n.t('coupon.field.code')
      f.input :discount, label: I18n.t('coupon.field.discount')
    end
    actions
  end
end
