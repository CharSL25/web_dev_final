class FixCategoryDependencies < ActiveRecord::Migration[7.0]
  def up
    Task.where.not(category_id: nil).find_each do |task|
      unless Category.exists?(task.category_id)
        task.update(category_id: nil)
      end
    end

    change_table :categories do |t|
      t.remove_references :user
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end