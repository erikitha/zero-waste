class RemoveBrandFromIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :brand
  end
end
