require "json"
require "open-uri"

# Dotenv.load
# Recipe.destroy_all
# Ingredient.destroy_all

api_key_recipe = ENV['SPOONACULAR']
api_key_ingredient = ENV['SPOONACULAR2']
#cada vez que roda o seed muda o offset, numero mantem o mesmo
offset = 135 #skip de receitas
number = 5 #numero de consulta da receita

#recipe
url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{api_key_recipe}&number=#{number}&offset=#{offset}" #url da receita
# add id da receita (migration)

recipes = URI.open(url).read
recipes_response = JSON.parse(recipes)

recipes_response["results"].each do |recipe|
  recipe_url = "https://api.spoonacular.com/recipes/#{recipe['id']}/information?apiKey=#{api_key_recipe}" #volta um info response para cada receita
  recipes_info = URI.open(recipe_url).read
  info_response = JSON.parse(recipes_info)


  Recipe.create!(name: recipe["title"], prep_time:  info_response["preparationMinutes"], description: info_response["summary"], url_image: recipe["image"], spoon_url: info_response["sourceUrl"], spoon_id: info_response["id"])
  # add id da receita (migration)


  puts recipe["title"]
  # puts recipe["id"]

  #consulta do end point que pega os ingredientes da receita
  ingredients_url = "https://api.spoonacular.com/recipes/#{recipe['id']}/ingredientWidget.json?apiKey=#{api_key_ingredient}"
  ingredients = URI.open(ingredients_url).read
  ingredients_response = JSON.parse(ingredients)
  ingredients_response["ingredients"].each do |ingredient|
    puts ingredient
    #consulta pelo nome do ingredientes para conseguir pegar o id
    name = ingredient["image"] ? ingredient["image"][0..-5] : "broccoli" #procurar ingrediente pelo nome da img
    ingredient_url = "https://api.spoonacular.com/food/ingredients/search?query=#{name}&apiKey=#{api_key_ingredient}"
    ingredient_read = URI.open(ingredient_url).read
    ingredient_response = JSON.parse(ingredient_read)
    id = ingredient_response["results"].empty? ? 20444 : ingredient_response["results"][0]["id"]  #evitar repeticao dos ingredientes
    # puts ingredient_response
    # puts ingredient["name"]
    #pegar info dos outros ingredientes
    ingredient_info_url = "https://api.spoonacular.com/food/ingredients/#{id}/information?apiKey=#{api_key_ingredient}"
    #info dos ingredientes criar ingredientes
    ingredient_info = URI.open(ingredient_info_url).read
    info = JSON.parse(ingredient_info)
    # criar img
    Ingredient.create(name: info["originalName"], category: info["categoryPath"][-1], image_url: "https://spoonacular.com/cdn/ingredients_250x250/#{info['image']}")
    puts info["originalName"] #para saber qual foi o ingrediente formado
    sleep(3)
  end
end
