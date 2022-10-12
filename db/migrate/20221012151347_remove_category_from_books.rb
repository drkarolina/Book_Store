class RemoveCategoryFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :books, :category, index: true, foreign_key: true
  end
end
