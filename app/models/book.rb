class Book < ApplicationRecord
  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book, dependent: :destroy

  has_many :category_book, dependent: :destroy
  has_many :categories, through: :category_book, dependent: :destroy
end
