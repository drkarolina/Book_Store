class RenameMatirialesToMaterials < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :materiales, :materials
  end
end