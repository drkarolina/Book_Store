class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.float :discount
      t.boolean :is_valid, default: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
