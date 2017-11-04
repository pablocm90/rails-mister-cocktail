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
Review.destroy_all


require 'json'
require 'open-uri'

url = 'https://api.github.com/users/ssaunier'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

require 'json'
require 'open-uri'


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data_serialized = open(url).read
data = JSON.parse(data_serialized)

data["drinks"].each do |element|
 name = element["strIngredient1"]
 ingr = Ingredient.create(name: name)
 puts "#{ingr.name} created!"
end

puts "Finished seeding"

