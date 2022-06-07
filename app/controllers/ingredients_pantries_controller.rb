class IngredientsPantriesController < ApplicationController

  def index
    @ingredients_pantries = IngredientPantry.where(user: current_user)
  end

  def new
    @ingredient_pantries.user = IngredientPantry.new
  end
end
