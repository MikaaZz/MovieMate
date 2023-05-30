require 'faker'

User.destroy_all
Listing.destroy_all
# Create seeding for users
50.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.city,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

# Create seeding for listings

20.times do |i|
  Listing.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.between(from: 10, to: 100),
    location: Faker::Address.city,
    user: User.all.sample,
    category: ["Action", "Adventure", "Animation", "Biography", "Comedy", "Crime", "Documentary", "Drama", "Family", "Fantasy", "History", "Horror", "Mystery", "Romance", "Sci-Fi"].sample
  )
end
