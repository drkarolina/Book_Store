ActiveAdmin.register Book do
  decorate_with BookDecorator
  permit_params :title, :price, :description, :published_at, :height, :width, :depth,
                :materials, :quantity, category_ids: [], author_ids: []
  includes :categories, :authors

  preserve_default_filters!
  remove_filter :author_book
  remove_filter :category_book
  filter :authors, as: :select, collection: proc { Author.order(:first_name).decorate }

  index do
    selectable_column
    id_column
    column :categories
    column :title
    column :authors_full_name
    column :short_description
    column :price
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :categories, collection: Category.all, as: :check_boxes
      f.input :authors, collection: Author.all.decorate, as: :check_boxes
      f.input :description, as: :simplemde_editor
      f.input :published_at, as: :datepicker, datepicker_options: { min_date: '1900-01-01' }
      f.input :price, min: 0
      f.input :height, min: 0
      f.input :width, min: 0
      f.input :depth, min: 0
      f.input :materials
      f.input :quantity, min: 0
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :categories
      row :authors_full_name
      row :description
      row :published_at
      row :price
      row :height
      row :width
      row :depth
      row :materials
      row :quantity
    end
  end
end
