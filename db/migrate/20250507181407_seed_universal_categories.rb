class SeedUniversalCategories < ActiveRecord::Migration[7.0]
  def up
    Category.predefined.each do |name|
      Category.find_or_create_by!(name: name)
    end
  end

  def down
    Category.where(name: Category.predefined).destroy_all
  end
end
