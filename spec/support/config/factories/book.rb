FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { FFaker::Number.decimal }
    description { FFaker::Book.description }
    published_at { FFaker::Time.date }
    height { FFaker::Number.decimal }
    width { FFaker::Number.decimal }
    depth { FFaker::Number.decimal }
    materials { FFaker::Lorem.word }
    quantity { FFaker::Number.number }
    preview_image do
      ActiveStorage::Blob.create_and_upload!(io: Rails.public_path.join('seeds/book_image.jpg').open,
                                             filename: 'book_image.jpg').signed_id
    end
    images do
      ActiveStorage::Blob.create_and_upload!(io: Rails.public_path.join('seeds/book_image.jpg').open,
                                             filename: 'book_image.jpg').signed_id
    end
  end
end
