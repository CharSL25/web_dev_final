class AddCategoryToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :category, foreign_key: true, null: true
  end
end
