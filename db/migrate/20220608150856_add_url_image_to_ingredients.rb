class AddUrlImageToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :image_url, :string
  end
end
