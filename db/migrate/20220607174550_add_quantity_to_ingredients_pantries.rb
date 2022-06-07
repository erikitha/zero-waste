class AddQuantityToIngredientsPantries < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredient_pantries, :quantity, :integer
  end
end
