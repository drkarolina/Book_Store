ActiveAdmin.register Category do
  permit_params :name

  index do
    selectable_column
    id_column

    column :name
    actions
  end

  show do
    attributes_table do
      row :name
    end
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    actions
  end
end
