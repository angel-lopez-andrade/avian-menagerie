class Bird < ApplicationRecord
  belongs_to :breed
  belongs_to :user
  has_one_attached :pic
  validates :name, :breed, :age, :price, :breed_id, :user_id, presence: true
end
