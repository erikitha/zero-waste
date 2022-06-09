class AddRecipesToSpoonurl < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :spoon_url, :string
  end
end
