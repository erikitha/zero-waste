milk = Ingredient.create!(name: "milk", brand: "parmalat", category: "dairy")
milk2 =Ingredient.create!(name: "milk", brand: "fazenda", category: "dairy")
chocolate = Ingredient.create!(name: "chocolate", brand: "parmalat", category: "sweet")

bolochocolate = Recipe.create!(name: "Bolo de Chocolate")

RecipeIngredient.create!(recipe: bolochocolate, ingredient: milk)
RecipeIngredient.create!(recipe: bolochocolate, ingredient: chocolate)

puts bolochocolate.ingredient
