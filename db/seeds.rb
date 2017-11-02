# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting all things"

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

puts "creating cocktails"

10.times do
  name = Faker::LordOfTheRings.character
  cocktail = Cocktail.new(name: name)
  cocktail.save
end

puts "creating ingredients"

15.times do
  name = Faker::Food.ingredient
  ingredient = Ingredient.new(name: name)
  ingredient.save
end

puts "creating doses"

30.times do
  quantity = rand(1..10)
  description = quantity.to_s + " " + Faker::Food.metric_measurement
  p description
  cocktail = Cocktail.all.sample
  ingredient = Ingredient.all.sample
  dose = Dose.new(description: description, cocktail: cocktail, ingredient: ingredient)
  dose.save
end

puts "done"
