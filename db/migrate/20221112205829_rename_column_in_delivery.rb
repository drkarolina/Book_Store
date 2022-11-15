class RenameColumnInDelivery < ActiveRecord::Migration[6.1]
  def change
    rename_column :deliveries, :method, :method_name
  end
end
