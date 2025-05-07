['Work', 'School', 'Fitness', 'Chores', 'Errands'].each do |name|
    Category.find_or_create_by!(name: name)
  end