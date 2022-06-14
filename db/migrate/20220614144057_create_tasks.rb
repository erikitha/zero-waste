class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
