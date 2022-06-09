class AddRecipesToSpoonid < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :spoon_id, :integer
  end
end
