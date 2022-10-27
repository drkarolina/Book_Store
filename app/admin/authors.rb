ActiveAdmin.register Author do
  decorate_with AuthorDecorator
  permit_params :first_name, :last_name, :description

  preserve_default_filters!
  remove_filter :author_book

  index do
    selectable_column
    id_column

    column :first_name
    column :last_name
    column :description
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :description
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :description
    end
    actions
  end
end
