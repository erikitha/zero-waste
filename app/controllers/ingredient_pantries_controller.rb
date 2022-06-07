class IngredientPantriesController < ApplicationController

  def index
    @ingredients_pantries = IngredientPantry.where(user: current_user)
  end

  def new
    @ingredient_pantry = IngredientPantry.new
  end

  def create
    @ingredient_pantry = IngredientPantry.new(ingredient_pantries_params)
    @ingredient_pantry.user = current_user

    if @ingredient_pantry.save
      redirect_to ingredient_pantries_path, notice: 'Ingredient was successfully created.'
    else
      render :new
    end

    def destroy
      @ingredient_pantry = IngredientPantry.find(params[:id])
      @ingredient_pantry.destroy
      redirect_to ingredient_pantries_path
    end
  end

  private

  def ingredient_pantries_params
    params.require(:ingredient_pantry).permit(:ingredient_id, :best_before, :lot, :quantity)
  end
end
