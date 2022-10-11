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
    category_id: rand(1..Category.count),
    authors: [authors.sample, authors.sample]
  )
  end
end

