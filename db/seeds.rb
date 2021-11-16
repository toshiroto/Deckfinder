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

joss_dixon = User.new(email: "jossdixon@gmail.com", password: "123456")
joss_dixon.save!
michiharu_ono = User.new(email: "michiharuono77@gmail.com", password: "567890")
michiharu_ono.save!
carlos_topete = User.new(email: "chtopete@gmail.com", password: "123098")
carlos_topete.save!

  deck_instance = Deck.create(
    name: Faker::Books::CultureSeries.book,
    desc: Faker::Quotes::Chiquito.joke,
    price: rand(1..100),
    user_id: joss_dixon.id
  )


puts 'done!'
