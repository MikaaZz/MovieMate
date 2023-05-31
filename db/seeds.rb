require 'faker'

puts 'Destroying existing records...'
Booking.destroy_all
Review.destroy_all
Listing.destroy_all
User.destroy_all

puts 'Creating new users...'

users = []
50.times do
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.city,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

puts 'Creating new listings...'

categories = %w[Action Adventure Animation Biography Comedy Crime Documentary Drama Family Fantasy History Horror Mystery Romance Sci-Fi]

listing_data = [
  {
    title: 'Action Movie Extravaganza',
    description: 'Get ready for non-stop action with this thrilling movie experience!',
    price: 12,
    location: 'Los Angeles',
    category: categories[0]
  },
  {
    title: 'Adventures of the Lost Treasure',
    description: 'Embark on an exciting adventure in search of hidden treasures!',
    price: 10,
    location: 'Amazon Rainforest',
    category: categories[1]
  },
  {
    title: 'Animated Wonderland',
    description: 'Experience the magic of animated characters coming to life in this enchanting movie!',
    price: 8,
    location: 'Dreamland',
    category: categories[2]
  },
  {
    title: 'Biography: Journey of Legends',
    description: 'Discover the inspiring true stories of legendary personalities!',
    price: 15,
    location: 'New York City',
    category: categories[3]
  },
  {
    title: 'Comedy Central',
    description: 'Laugh out loud with this hilarious comedy movie that will keep you entertained!',
    price: 9,
    location: 'San Francisco',
    category: categories[4]
  },
  {
    title: 'Crime Chronicles',
    description: 'Dive into the thrilling world of crime and mystery with this captivating movie!',
    price: 11,
    location: 'Chicago',
    category: categories[5]
  },
  {
    title: 'Documentary Discoveries',
    description: 'Explore fascinating real-life stories and gain knowledge with this thought-provoking documentary!',
    price: 7,
    location: 'Washington D.C.',
    category: categories[6]
  },
  {
    title: 'Drama Delights',
    description: 'Experience powerful emotions and compelling narratives with this gripping drama movie!',
    price: 10,
    location: 'London',
    category: categories[7]
  },
  {
    title: 'Family Fun Fiesta',
    description: 'Enjoy quality time with your loved ones with this heartwarming family movie!',
    price: 8,
    location: 'Orlando',
    category: categories[8]
  },
  {
    title: 'Fantasy World Wonders',
    description: 'Escape to a world of fantasy and magic with this enchanting movie adventure!',
    price: 12,
    location: 'Magical Kingdom',
    category: categories[9]
  },
  {
    title: 'Historical Epics',
    description: 'Travel back in time and witness historical events unfold in this epic movie journey!',
    price: 14,
    location: 'Rome',
    category: categories[10]
  },
  {
    title: 'Horror House',
    description: 'Prepare to be scared! This horror movie will send chills down your spine!',
    price: 13,
    location: 'Haunted Mansion',
    category: categories[11]
  }
]

listings = []
listing_data.each do |data|
  listing = Listing.create(
    title: data[:title],
    description: data[:description],
    price: data[:price],
    location: data[:location],
    category: data[:category],
    user: users.sample
  )
  listings << listing if listing.valid?
end

puts 'Creating new bookings...'
12.times do
  Booking.create!(
    date: Faker::Date.between(from: '2023-05-31', to: '2023-07-25'),
    request: Faker::Hipster.paragraph(sentence_count: 2),
    duration: Faker::Number.between(from: 1, to: 10),
    listing: listings.sample,
    user: users.sample
  )
end

puts 'Seeding completed!'
