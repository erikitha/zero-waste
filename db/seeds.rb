require "json"
require "open-uri"

Dotenv.load
Recipe.destroy_all

api_key = ENV['SPOONACULAR']
#recipe
url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{api_key}&number=50" #url da receita
recipes = URI.open(url).read
recipes_response = JSON.parse(recipes)

recipes_response["results"].each do |recipe|
  recipe_url = "https://api.spoonacular.com/recipes/#{recipe['id']}/information?apiKey=#{api_key}"
  recipes_info = URI.open(recipe_url).read
  info_response = JSON.parse(recipes_info)


  Recipe.create!(name: recipe["title"], prep_time:  info_response["preparationMinutes"], description: info_response["summary"], url_image: recipe["image"])
  puts recipe["title"]
end







#ingredients
url = "https://api.spoonacular.com/food/ingredients/{id}/information#{api_key}&number=100"
ingredients = URI.open(ingredient_url).read
ingredients_response = JSON.parse(ingredients)

ingredients_response["results"].each do |ingredient|
  ingredients_info = URI.open(ingredient_url).read
  info_response = JSON.parse(ingredients_info)


  Ingredient.create!(name: ingredient["name"], category:  info_response["name"], url_image: ingredient["image"])
  puts ingredient["title"]
end




















# açúcar = Ingredient.create!(name: "açúcar", brand: "Dr.Oetker", category: "açúcar")
# água = Ingredient.create!(name: "água", brand: "água", category: "água")
# alho = Ingredient.create!(name: "alho", brand: "Guidan", category: "alho")
# cebolinha = Ingredient.create!(name: "cebolinha", brand: "cebolinha", category: "cebolinha")
# chocolate = Ingredient.create!(name: "chocolate", brand: "Nestle", category: "doce")
# chocolate em pó = Ingredient.create!(name: "chocolate em pó", brand: "Nestle", category: "doce")
# farinha de trigo = Ingredient.create!(name: "farinha de trigo", brand: "Dona Benta", category: "farinha")
# fermento biológico = Ingredient.create!(name: "fermento biológico", brand: "cebolinha", category: "fermento")
# fermento químico = Ingredient.create!(name: "fermento químico", brand: "Dr.Oetker", category: "fermento")
# leite = Ingredient.create!(name: "leite", brand: "Parmalat", category: "laticínios")
# manteiga = Ingredient.create!(name: "manteiga", brand: "President", category: "manteiga")
# óleo vegetal = Ingredient.create!(name: "óleo vegetal", brand: "Liza", category: "óleo")
# orégano = Ingredient.create!(name: "orégano", brand: "Tirolez", category: "temperos")
# ovo = Ingredient.create!(name: "ovo", brand: "Avine", category: "ovo")
# queijo = Ingredient.create!(name: "queijo", brand: "Tirolez", category: "laticínios")
# sal = Ingredient.create!(name: "sal", brand: "Cisne", category: "sal")
# tomate = Ingredient.create!(name: "tomate", brand: "tomate", category: "fruta")


# bolo_chocolate = Recipe.create!(name: "Bolo de Chocolate", preptime: "60 min", description: "A melhor receita de bolo de chocolate!")
# brigadeiro = Recipe.create!(name: "Brigadeiro", preptime: "30 min", description: "Delicioso e prático!")
# omelete = Recipe.create!(name: "Omelette du fromage", preptime: "10 min", description: "O clássico frânces do renomado Chef Dexter!")
# torta_de_morango = Recipe.create!(name: "Torta de Morango", preptime: "100 min", description: "Bela e recatada")
# pão_italiano = Recipe.create!(name: "Pão Italiano", preptime: "150 min", description: "Mamma mia!")

# RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: leite)
# RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: chocolate_em_pó)
# RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: farinha_de_trigo)
# RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: ovo)
# RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: fermento_químico)
# RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: óleo_vegetal)
# RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: chocolate_em_pó)
# RecipeIngredient.create!(recipe: brigadeiro, ingredient: leite)
# RecipeIngredient.create!(recipe: brigadeiro, ingredient: manteiga)
# RecipeIngredient.create!(recipe: brigadeiro, ingredient: chocolate_em_pó)
# RecipeIngredient.create!(recipe: omelete, ingredient: ovo)
# RecipeIngredient.create!(recipe: omelete, ingredient: sal)
# RecipeIngredient.create!(recipe: omelete, ingredient: manteiga)
# RecipeIngredient.create!(recipe: omelete, ingredient: queijo)
# RecipeIngredient.create!(recipe: omelete, ingredient: alho)
# RecipeIngredient.create!(recipe: omelete, ingredient: orégano)
# RecipeIngredient.create!(recipe: omelete, ingredient: tomate)
# RecipeIngredient.create!(recipe: torta_de_morango, ingredient: morango)
# RecipeIngredient.create!(recipe: torta_de_morango, ingredient: farinha_de_trigo)
# RecipeIngredient.create!(recipe: torta_de_morango, ingredient: ovo)
# RecipeIngredient.create!(recipe: torta_de_morango, ingredient: leite)
# RecipeIngredient.create!(recipe: torta_de_morango, ingredient: fermento_químico)
# RecipeIngredient.create!(recipe: torta_de_morango, ingredient: açúcar)
# RecipeIngredient.create!(recipe: torta_de_morango, ingredient: manteiga)
# RecipeIngredient.create!(recipe: pão_italiano, ingredient: sal)
# RecipeIngredient.create!(recipe: pão_italiano, ingredient: fermento_biológico)
# RecipeIngredient.create!(recipe: pão_italiano, ingredient: farinha_de_trigo)
# RecipeIngredient.create!(recipe: pão_italiano, ingredient: ovo)
# RecipeIngredient.create!(recipe: pão_italiano, ingredient: água)
