class Book < ApplicationRecord
  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book, dependent: :destroy

  has_many :category_book, dependent: :destroy
  has_many :categories, through: :category_book, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_one_attached :preview_image
  has_many_attached :images

  validates :title, :price, :published_at, :height,
            :width, :depth, :materials, :quantity, presence: true
end
