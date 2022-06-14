class FavoriteRecipesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    FavoriteRecipe.create(recipe: @recipe, user: current_user)
    redirect_to @recipe
  end

  def destroy
    @favorite = FavoriteRecipe.find(params[:id])
    @recipe = @favorite.recipe
    @favorite.destroy
    redirect_to @recipe
  end
end
