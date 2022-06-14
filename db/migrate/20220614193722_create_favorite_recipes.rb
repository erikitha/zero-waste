class CreateFavoriteRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_recipes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
