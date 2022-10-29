class Book < ApplicationRecord
  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book, dependent: :destroy

  has_many :category_book, dependent: :destroy
  has_many :categories, through: :category_book, dependent: :destroy

  has_many :reviews, dependent: :destroy

  validates :title, :price, :published_at, :height,
            :width, :depth, :materials, :quantity, presence: true
end
