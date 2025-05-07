class AddPredefinedCategories < ActiveRecord::Migration[7.0]
  def up
    User.find_each do |user|
      [ 'Work', 'School', 'Fitness', 'Chores', 'Errands' ].each do |name|
        user.categories.find_or_create_by!(name: name)
      end
    end
  end

  def down
  end
end
