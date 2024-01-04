require 'ffaker'

CATEGORIES = {
  mobile_development: 'Mobile Development',
  photo: 'Photo',
  web_design: 'Web Design',
  web_development: 'Web Development'
}.freeze

CATEGORIES.each_value { |category| Category.create(name: category) } if Category.count.zero?

if Author.count.zero?
  10.times do
      Author.create!(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name
      )
  end
end

if Book.count.zero?
  authors = Author.all
  categories = Category.all
10.times do
  b = Book.create(
    title: FFaker::Book.title,
    price: FFaker::Number.decimal,
    description: FFaker::Book.description,
    published_at: FFaker::Time.date,
    height: FFaker::Number.decimal,
    width: FFaker::Number.decimal,
    depth: FFaker::Number.decimal,
    materials: FFaker::Lorem.word,
    quantity: FFaker::Number.number,
    authors: authors.sample(2),
    categories: categories.sample(2), 
  )
  b.preview_image.attach(
    io:  File.open(File.join(Rails.root,'public/seeds/book_preview_image.jpg')),
    filename: 'book_preview_image.jpg'
  )
  b.images.attach(
    io:  File.open(File.join(Rails.root,'public/seeds/book_image.jpg')),
    filename: 'book_image.jpg'
  )
  end
end

if AdminUser.count.zero?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

if User.count.zero?
  user = User.new(email: 'user@example.com', password: '123123Qq', password_confirmation: '123123Qq')
  user.skip_confirmation!
  user.save!
end

if Delivery.count.zero?
  Delivery.create!(method_name: 'By plane', min_days: 3, max_days: 7, price: 28.5)
  Delivery.create!(method_name: 'By train', min_days: 5, max_days: 7, price: 18)
end