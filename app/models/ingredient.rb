class Ingredient < ApplicationRecord
  has_many :ingredients_pantries
  has_many :recipes_ingredients
  validates :name, uniqueness: true
end
