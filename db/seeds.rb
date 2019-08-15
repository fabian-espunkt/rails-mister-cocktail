require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink_serialized = open(url).read
drinks = JSON.parse(drink_serialized)
# p drink
drinks.each_with_index do |drink, index|
  list = drink[1]
  list.each do |x|
    Ingredient.create(name: x["strIngredient1"])
  end
end
