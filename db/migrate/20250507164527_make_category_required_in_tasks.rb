class MakeCategoryRequiredInTasks < ActiveRecord::Migration[7.0]
  def up
    # Create a default "Uncategorized" category for all users
    default_category_name = "Uncategorized"
    
    User.find_each do |user|
      category = user.categories.find_or_create_by!(name: default_category_name) do |c|
        c.description = "Default category for existing tasks"
      end
      
      # Assign this category to all tasks without a category
      user.tasks.where(category_id: nil).update_all(category_id: category.id)
    end

    # Now we can safely add the NOT NULL constraint
    change_column_null :tasks, :category_id, false
  end

  def down
    change_column_null :tasks, :category_id, true
  end
end