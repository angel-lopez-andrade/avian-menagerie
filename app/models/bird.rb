class Bird < ApplicationRecord
  belongs_to :breed
  belongs_to :user
  has_one_attached :pic
end
