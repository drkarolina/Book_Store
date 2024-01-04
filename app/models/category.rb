class Category < ApplicationRecord
  has_many :category_book, dependent: :destroy
  has_many :books, through: :category_book, dependent: :destroy

  validates :name, presence: true
end
