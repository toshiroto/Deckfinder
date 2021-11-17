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

# 5.times { Deck.create(
#     name: Faker::Music::Prince.album,
#     desc: Faker::Quotes::Chiquito.joke,
#     price: rand(1..100),
#     user_id: carlos_topete.id
#   )
# }

Deck.create(
  name: "Sultai Ultimatum",
  desc: "This deck focuses around ramping out hard to play Sultai Ultimatum as soon as possible, at which point you get the three most powerful cards in your deck and force your opponent to pick their own poison.",
  price: rand(1..100),
  user_id: joss_dixon.id
)

Deck.create(
  name: "Red Deck Wins",
  desc: "Red decks have always been fairly simple to pilot while still being competitively viable, meaning that this is a great deck for a beginner player.This deck may be simple to pilot but it’s very effective, if your opponent has little to no removal they’ll soon find themselves swarmed with goblin tokens and damage amplifiers.",
  price: rand(1..100),
  user_id: joss_dixon.id
)

Deck.create(
  name: "Izzet Gold",
  desc: "This deck aims to create a ton of mana from Treasures in order to pump Inferno of the Star Mounts to the point where it can automatically kill your opponent. What's Good About Izzet Gold:Allows you to do some of the coolest things in Magic: Cast big spells and play huge creatures.",
  price: rand(1..100),
  user_id: joss_dixon.id
)

Deck.create(
  name: "Naya Adventures",
  desc: "This midrange deck aims to use the new Class cards as support for an aggro creature deck. You’re going to look to swarm the board early with some cheap creatures, and then use effects like Ranger Class to pump them up to be huge threats.",
  price: rand(1..100),
  user_id: joss_dixon.id
)

Deck.create(
  name: "Jeskai Cycling",
  desc: "Jeskai Cycling looks to abuse the Cycling mechanic, with a ton of great payoff cards. You’ll look to use cycling to churn through your deck as fast as possible to find more Cycling cards, all the while you have something like an Irencrag Pyromancer or Valiant Rescuer on the field to gain you additional value.",
  price: rand(1..100),
  user_id: carlos_topete.id
)

Deck.create(
  name: "Dimir Rogues",
  desc: "Dimir Rogues looks to take advantage of the mill synergies rogues got in Zendikar Rising to obliterate their opponent's deck. This is also a control deck, with plenty of counterspells and removal to make sure you're safe while you're milling. Uses the Dungeon mechanic to supply a lot of versatile value as you’re playing.",
  price: rand(1..100),
  user_id: carlos_topete.id
)

Deck.create(
  name: "Gruul Aggro",
  desc: "This newest iteration of a classic archetype looks to use the new Dungeon mechanic to supply extra value while beating in with massive creatures. ",
  price: rand(1..100),
  user_id: carlos_topete.id
)

Deck.create(
  name: "Rakdos Midrange",
  desc: "Rakdos Midrange works to strip value from your opponents while using sacrifice effects to advance your own board. Using cards like Kroxa to strip cards from your opponents.",
  price: rand(1..100),
  user_id: carlos_topete.id
)

Deck.create(
  name: "Boros Aggro",
  desc: "This deck is built primarily around Winota, and using her ability to completely smother your opponents in value.　Focuses around cheating out huge beaters for completely free, which is extremely powerful",
  price: rand(1..100),
  user_id: carlos_topete.id
)

Deck.create(
  name: "Mardu Midrange",
  desc: "This aristocrats deck looks to gain value by sacrificing your own creatures for massive value. Has a ton of different payoff effects for sacrificing your own creatures, such as the drain effects from Warlock Class and Bastion of Remembrance.",
  price: rand(1..100),
  user_id: carlos_topete.id
)
puts 'done!'

require 'json'
require 'open-uri'
require 'uri'

puts 'Creating cards now white'

url = "https://api.magicthegathering.io/v1/cards?colorIdentity=%22W%22"
card_serialized = URI.open(url).read
mtg = JSON.parse(card_serialized)

cards = mtg["cards"] # array of cards

puts 'creating cards'

cards.first(7).each do |card|

  mtg_card = Card.create(name: card["name"], imageUrl: card["imageUrl"], text: card["text"], colors: card["colors"])
  file = URI.open(card["imageUrl"])
  # mtg_card.photo.attach(io: file, filename: "#{card["name"]}.jpg") # , content_type: 'image/jpg'
   puts "#{mtg_card.id} is created"
end

puts "done!"

# puts 'Creating cards now Black'

# url = "https://api.magicthegathering.io/v1/cards?colorIdentity=%22B%22"
# card_serialized = URI.open(url).read
# mtg = JSON.parse(card_serialized)

# cards = mtg["cards"] # array of cards

# puts 'creating cards'

# cards.first(7).each do |card|

#   mtg_card = Card.create(name: card["name"], imageUrl: card["imageUrl"], text: card["text"], colors: card["colors"])
#   file = URI.open(card["imageUrl"])
#   mtg_card.photo.attach(io: file, filename: "#{card["name"]}.jpg") # , content_type: 'image/jpg'
#    puts "#{mtg_card.id} is created"
# end

# puts "done!"

# puts 'Creating cards now Green'

# url = "https://api.magicthegathering.io/v1/cards?colorIdentity=%22G%22"
# card_serialized = URI.open(url).read
# mtg = JSON.parse(card_serialized)

# cards = mtg["cards"] # array of cards

# puts 'creating cards'

# cards.first(7).each do |card|

#   mtg_card = Card.create(name: card["name"], imageUrl: card["imageUrl"], text: card["text"], colors: card["colors"])
#   file = URI.open(card["imageUrl"])
#   mtg_card.photo.attach(io: file, filename: "#{card["name"]}.jpg") # , content_type: 'image/jpg'
#    puts "#{mtg_card.id} is created"
# end

# puts "done!"

# puts 'Creating cards now Red'

# url = "https://api.magicthegathering.io/v1/cards?colorIdentity=%22R%22"
# card_serialized = URI.open(url).read
# mtg = JSON.parse(card_serialized)

# cards = mtg["cards"] # array of cards

# puts 'creating cards'

# cards.first(7).each do |card|

#   mtg_card = Card.create(name: card["name"], imageUrl: card["imageUrl"], text: card["text"], colors: card["colors"])
#   file = URI.open(card["imageUrl"])
#   mtg_card.photo.attach(io: file, filename: "#{card["name"]}.jpg") # , content_type: 'image/jpg'
#    puts "#{mtg_card.id} is created"
# end

# puts "done!"
