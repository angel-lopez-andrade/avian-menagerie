class Cage < ApplicationRecord
  belongs_to :cage_variety
  has_one_attached :pic
end
