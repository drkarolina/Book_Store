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
50.times do
  Book.create!(
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
    categories: categories.sample(2)
  )
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?