ActiveAdmin.register Book do
  decorate_with BookDecorator
  permit_params :title, :price, :description, :published_at, :height, :width, :depth,
                :materials, :quantity, :preview_image, images: [], category_ids: [], author_ids: []
  includes :categories, :authors

  preserve_default_filters!
  remove_filter :author_book
  remove_filter :category_book
  filter :authors, as: :select, collection: proc {
                                              Author.order(:first_name).decorate
                                            }, label: I18n.t('book.field.authors')

  index do
    selectable_column
    id_column
    column I18n.t('book.field.categories'), :categories
    column I18n.t('book.field.title'), :title
    column I18n.t('book.field.authors'), :authors_full_name
    column I18n.t('book.field.description'), :short_description
    column I18n.t('book.field.price'), :price
    column :preview_image do |book|
      image_tag book.preview_image.variant(resize: Constants::SMALL_SIZE_IMAGE) if book.preview_image.attached?
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title, label: I18n.t('book.field.title')
      f.input :categories, collection: Category.all, as: :check_boxes, label: I18n.t('book.field.categories')
      f.input :authors, collection: Author.all.decorate, as: :check_boxes, label: I18n.t('book.field.authors')
      f.input :description, as: :simplemde_editor, label: I18n.t('book.field.description')
      f.input :published_at, as: :datepicker, datepicker_options: { min_date: '1900-01-01' },
                             label: I18n.t('book.field.published_at')
      f.input :price, min: 0, label: I18n.t('book.field.price')
      f.input :height, min: 0, label: I18n.t('book.field.height')
      f.input :width, min: 0, label: I18n.t('book.field.width')
      f.input :depth, min: 0, label: I18n.t('book.field.depth')
      f.input :materials, label: I18n.t('book.field.materials')
      f.input :quantity, min: 0, label: I18n.t('book.field.quantity')
      f.input :preview_image, as: :file, label: I18n.t('book.field.preview_image')
      f.input :images, as: :file, input_html: { multiple: true }, label: I18n.t('book.field.images')
    end
    actions
  end

  show do
    attributes_table do
      row I18n.t('book.field.title'), &:title
      row I18n.t('book.field.categories'), &:categories
      row I18n.t('book.field.authors'), &:authors_full_name
      row I18n.t('book.field.description'), &:description
      row I18n.t('book.field.published_at'), &:published_at
      row I18n.t('book.field.price'), &:price
      row I18n.t('book.field.height'), &:height
      row I18n.t('book.field.width'), &:width
      row I18n.t('book.field.depth'), &:depth
      row I18n.t('book.field.materials'), &:materials
      row I18n.t('book.field.quantity'), &:quantity
      row :preview_image do |book|
        image_tag book.preview_image.variant(resize: Constants::SMALL_SIZE_IMAGE) if book.preview_image.attached?
      end
      row :images do |book|
        ul do
          book.images.each do |img|
            li do
              image_tag img.variant(resize: Constants::SMALL_SIZE_IMAGE)
            end
          end
        end
      end
    end
  end
end
