class MakeCategoryRequiredInTasks < ActiveRecord::Migration[7.0]
  def up
    default_category_name = "Uncategorized"

    User.find_each do |user|
      category = user.categories.find_or_create_by!(name: default_category_name) do |c|
        c.description = "Default category for existing tasks"
      end

      user.tasks.where(category_id: nil).update_all(category_id: category.id)
    end

    change_column_null :tasks, :category_id, false
  end

  def down
    change_column_null :tasks, :category_id, true
  end
end
