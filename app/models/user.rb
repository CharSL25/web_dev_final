class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
