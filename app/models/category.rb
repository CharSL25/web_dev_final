class Category < ApplicationRecord
  PREDEFINED_CATEGORIES = [
    "Food",
    "Travel",
    "Education",
    "Health",
    "Technology"
  ].freeze

  def self.predefined
    PREDEFINED_CATEGORIES
  end
  has_many :tasks, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
