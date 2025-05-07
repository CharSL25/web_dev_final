class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  validates :title, presence: true
  validates :completed, inclusion: { in: [ true, false ] }

  scope :incomplete, -> { where(completed: false) }
  scope :complete, -> { where(completed: true) }
end
