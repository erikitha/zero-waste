class IngredientPantriesController < ApplicationController

  def index
    @ingredients_pantries = IngredientPantry.where(user: current_user)
  end

  def new
    @ingredient_pantries = IngredientPantry.new
  end

end
