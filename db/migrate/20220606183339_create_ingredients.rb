class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :brand
      t.string :category

      t.timestamps
    end
  end
end
