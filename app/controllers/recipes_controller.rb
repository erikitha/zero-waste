class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    if params[:query].present?
      sql_query = "name ILIKE :query"
      @recipes = Recipe.where(sql_query, query: "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      # dessa forma nosso movies controller vai renderizar somente o partial para os usuarios
      # que tem JS habilitado no navegador. Agora se formos no console percebam que não temos
      # mais head nem meta, somente o partial. e é esse partial que queremos usar pra substituir nossa lista
      # VAMOS VOLTAR NO JS CONTROLLER E FAZER ISSO.
      format.text { render partial: 'recipe/list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(movie_params)

    # não queremos renderizar a pagina somente o partial do cartãozinho que queremos update
    respond_to do |format|
      format.html { redirect_to recipes_path }
      format.text { render partial: 'recipes/recipe_infos', locals: { recipe: @recipe }, formats: [:html] }
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
