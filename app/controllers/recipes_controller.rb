class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    if params[:query].present?
      sql_query = "name ILIKE :query"
      @recipes = Recipe.where(sql_query, query: "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html { }
      format.text { render partial: "recipes/recipe_infos", locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
