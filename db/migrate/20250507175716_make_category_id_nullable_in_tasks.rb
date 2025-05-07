class MakeCategoryIdNullableInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tasks, :category_id, true
  end
end