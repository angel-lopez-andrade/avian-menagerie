class Snack < ApplicationRecord
  belongs_to :snack_variety
  has_one_attached :pic
end
