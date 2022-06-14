class IngredientPantriesController < ApplicationController

  def index
    # @ingredients_pantries = IngredientPantry.where(user: current_user)
    # @expiring = ingredients_pantries.reject do |ingredient|
    #   ingredient.best_before - Date.today >= 2
    # end
    # @valid = @ingredients_pantries.select do |ingredient|
    #   ingredient.best_before - Date.today >= 2
    # end
    # TwilioClient.new.send_text(current_user, "You have ingredients expiring in your storage!") unless @expiring.empty?
    # Semana que vem fazer um background job para verificar se está chegando os produtos na validade 1x por dia
    ingredients_pantries = IngredientPantry.where(user: current_user)
    if params[:query].present?
      sql_query = "name ILIKE :query"
      ingredients = Ingredient.where(sql_query, query: "%#{params[:query]}%")
      ingredients_pantries = ingredients_pantries.where(ingredient: ingredients)
    end
    @expiring = ingredients_pantries.reject do |ingredient|
      ingredient.best_before - Date.today >= 2
    end
    respond_to do |format|
      format.html { }
      format.text { render partial: "ingredient_pantries/ingredient_infos", locals: { expiring: @expiring }, formats: [:html] }
    end
  end

  def new
    @ingredient_pantry = IngredientPantry.new
  end

  def create
    @ingredient_pantry = IngredientPantry.new(ingredient_pantries_params)
    @ingredient_pantry.user = current_user

    if @ingredient_pantry.save
      redirect_to ingredient_pantries_path, notice: 'Ingredient was successfully created!'
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
