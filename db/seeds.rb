milk = Ingredient.create!(name: "milk", brand: "parmalat", category: "dairy")
milk2 =Ingredient.create!(name: "milk", brand: "fazenda", category: "dairy")
chocolate = Ingredient.create!(name: "chocolate", brand: "parmalat", category: "sweet")
















bolo_chocolate = Recipe.create!(name: "Bolo de Chocolate", preptime: "60 min", description: "A melhor receita de bolo de chocolate!")
brigadeiro = Recipe.create!(name: "Brigadeiro", preptime: "30 min", description: "Delicioso e prático!")
omelete = Recipe.create!(name: "Omelette du fromage", preptime: "10 min", description: "O clássico frânces do renomado Chef Dexter!")
torta_de_morango = Recipe.create!(name: "Torta de Morango", preptime: "100 min", description: "Bela e recatada")
pão_italiano = Recipe.create!(name: "Pão Italiano", preptime: "150 min", description: "Mamma mia!")

RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: leite)
RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: chocolate_em_pó)
RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: farinha_de_trigo)
RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: ovo)
RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: fermento_químico)
RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: óleo_vegetal)
RecipeIngredient.create!(recipe: bolo_chocolate, ingredient: chocolate_em_pó)
RecipeIngredient.create!(recipe: brigadeiro, ingredient: leite)
RecipeIngredient.create!(recipe: brigadeiro, ingredient: manteiga)
RecipeIngredient.create!(recipe: brigadeiro, ingredient: chocolate_em_pó)
RecipeIngredient.create!(recipe: omelete, ingredient: ovo)
RecipeIngredient.create!(recipe: omelete, ingredient: sal)
RecipeIngredient.create!(recipe: omelete, ingredient: manteiga)
RecipeIngredient.create!(recipe: omelete, ingredient: queijo)
RecipeIngredient.create!(recipe: omelete, ingredient: alho)
RecipeIngredient.create!(recipe: omelete, ingredient: orégano)
RecipeIngredient.create!(recipe: omelete, ingredient: tomate)
RecipeIngredient.create!(recipe: torta_de_morango, ingredient: morango)
RecipeIngredient.create!(recipe: torta_de_morango, ingredient: farinha_de_trigo)
RecipeIngredient.create!(recipe: torta_de_morango, ingredient: ovo)
RecipeIngredient.create!(recipe: torta_de_morango, ingredient: leite)
RecipeIngredient.create!(recipe: torta_de_morango, ingredient: fermento_químico)
RecipeIngredient.create!(recipe: torta_de_morango, ingredient: açúcar)
RecipeIngredient.create!(recipe: torta_de_morango, ingredient: manteiga)
RecipeIngredient.create!(recipe: pão_italiano, ingredient: sal)
RecipeIngredient.create!(recipe: pão_italiano, ingredient: fermento_biológico)
RecipeIngredient.create!(recipe: pão_italiano, ingredient: farinha_de_trigo)
RecipeIngredient.create!(recipe: pão_italiano, ingredient: ovo)
RecipeIngredient.create!(recipe: pão_italiano, ingredient: água)
