class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :name
      t.string :month_year
      t.string :cvv
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
