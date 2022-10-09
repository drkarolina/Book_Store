class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.float :price
      t.text :description
      t.date :published_at
      t.float :height
      t.float :width
      t.float :depth
      t.string :matiriales
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
