class AddPriorityToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :priority, :boolean
  end
end
