class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :method
      t.integer :min_days
      t.integer :max_days
      t.float :price

      t.timestamps
    end
  end
end
