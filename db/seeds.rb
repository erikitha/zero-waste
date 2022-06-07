milk = Ingredient.create!(name: "milk", brand: "parmalat", category: "dairy")
milk2 =Ingredient.create!(name: "milk", brand: "fazenda", category: "dairy")
chocolate = Ingredient.create!(name: "chocolate", brand: "nestle", category: "sweet")
chocolate em pó = Ingredient.create!(name: "chocolate em pó", brand: "nestle", category: "chocolate")
butter = Ingredient.create!(name: "butter", brand: "president", category: "butter")
farinha de trigo = Ingredient.create!(name: "butter", brand: "dona benta", category: "butter")














chocolatecake = Recipe.create!(name: "Chocolate Cake")




















RecipeIngredient.create!(recipe: chocolatecake, ingredient: milk)
RecipeIngredient.create!(recipe: chocolatecake, ingredient: chocolate)
