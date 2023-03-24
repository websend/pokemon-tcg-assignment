# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

basic_card_pack = CardPack.create(
  name: "Basic",
  description: "Don't expect anything good.",
  coins: 100
)

premium_card_pack = CardPack.find_or_create_by(
  name: "Premium",
  description: "Now we're talking.",
  coins: 300
)

Trainer.first&.update(coins: 1200)