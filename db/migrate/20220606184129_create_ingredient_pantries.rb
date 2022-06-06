class CreateIngredientPantries < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_pantries do |t|
      t.date :best_before
      t.string :lot
      t.references :user, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
