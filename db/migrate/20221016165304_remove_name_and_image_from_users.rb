class RemoveNameAndImageFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name
    remove_column :users, :image
  end
end
