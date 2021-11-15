# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."
Deck.destroy_all
User.destroy_all
puts 'database is clean'
puts 'creating Decks'
puts 'creating Users'

100.times do
  user_instance = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  deck_instance = Deck.create(
    name: Faker::Books::CultureSeries.book,
    desc: Faker::Quotes::Chiquito.joke,
    price: rand(1..100),
    user_id: user_instance.id
  )
  puts "User #{user_instance.id} is created"
  puts "Deck #{deck_instance.id} is created"
end

puts 'done!'
