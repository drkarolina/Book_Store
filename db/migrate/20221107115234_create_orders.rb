class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.references :user, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
