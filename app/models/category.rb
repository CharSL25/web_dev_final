class Category < ApplicationRecord
  CATEGORIES = [
    "Food",
    "Travel",
    "Education",
    "Health",
    "Technology"
  ].freeze

  belongs_to :user

  def self.defined
    CATEGORIES
  end
  has_many :tasks, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
