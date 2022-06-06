class Ingredient < ApplicationRecord
  has_many :ingredients_pantries
  has_many :recipes_ingredients
end
