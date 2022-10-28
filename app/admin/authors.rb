ActiveAdmin.register Author do
  decorate_with AuthorDecorator
  permit_params :first_name, :last_name, :description

  preserve_default_filters!
  remove_filter :author_book

  index do
    selectable_column
    id_column

    column I18n.t('author.field.first_name'), :first_name
    column I18n.t('author.field.last_name'), :last_name
    column I18n.t('author.field.description'), :description
    actions
  end

  show do
    attributes_table do
      row I18n.t('author.field.first_name'), &:first_name
      row I18n.t('author.field.last_name'), &:last_name
      row I18n.t('author.field.description'), &:description
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name, label: I18n.t('author.field.first_name')
      f.input :last_name, label: I18n.t('author.field.last_name')
      f.input :description, label: I18n.t('author.field.description')
    end
    actions
  end
end
