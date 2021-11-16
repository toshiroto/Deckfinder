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

joss_dixon = User.new(name: "Joss Dixon", email: "josscdixon@gmail.com", password: "12345")
joss_dixon.save!
michiharu_ono = User.new(name: "michiharu Ono", email: "michiharuono77gmail.com", password: "67890")
michiharu_ono.save!
carlos_topete = User.new(name: "Carlos Topete", email: "chtopete@gmail.com", password: "12309")
carlos_topete.save!

  deck_instance = Deck.create(
    name: Faker::Books::CultureSeries.book,
    desc: Faker::Quotes::Chiquito.joke,
    price: rand(1..100),
    user_id: user_instance.id
  )
  puts "User #{user_instance.id} is created"
  puts "Deck #{deck_instance.id} is created"

puts 'done!'
