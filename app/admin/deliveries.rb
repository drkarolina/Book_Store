ActiveAdmin.register Delivery do
  permit_params :method_name, :min_days, :max_days, :price

  index do
    selectable_column
    id_column

    column I18n.t('delivery.field.method_name'), :method_name
    column I18n.t('delivery.field.min_days'), :min_days
    column I18n.t('delivery.field.max_days'), :max_days
    column I18n.t('delivery.field.price'), :price
    actions
  end

  form do |f|
    f.inputs do
      f.input :method_name, label: I18n.t('delivery.field.method_name')
      f.input :min_days, label: I18n.t('delivery.field.min_days')
      f.input :max_days, label: I18n.t('delivery.field.max_days')
      f.input :price, label: I18n.t('delivery.field.price')
    end
    actions
  end
end
