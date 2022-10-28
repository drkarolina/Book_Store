ActiveAdmin.register Category do
  permit_params :name

  preserve_default_filters!
  remove_filter :category_book

  index do
    selectable_column
    id_column

    column I18n.t('category.field.name'), :name
    actions
  end

  show do
    attributes_table do
      row I18n.t('category.field.name'), &:name
    end
  end

  form do |f|
    f.inputs do
      f.input :name, label: I18n.t('category.field.name')
    end
    actions
  end
end
