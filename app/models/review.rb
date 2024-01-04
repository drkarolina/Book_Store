class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :title, :text, :rating, presence: true

  enum status: { unprocessed: 0, approved: 1, rejected: 2 }
end
