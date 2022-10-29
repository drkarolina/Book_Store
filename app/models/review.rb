class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :title, :text, :rating, :status, presence: true
end
