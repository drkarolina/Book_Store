class Book < ApplicationRecord
  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book, dependent: :destroy

  belongs_to :category
end
