# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
5.times do
  a = Restaurant.new(
    name: "#{Faker::StarWars.character}",
    address: "#{Faker::StarWars.planet}",
    category: Restaurant::CATEGORY.sample
  )

  a.save
  10.times do
    b = Review.new(
      content: "#{Faker::StarWars.quote}",
      rating: %w[0..5].sample.to_i
    )

    b.restaurant = a
    b.save
  end
end
