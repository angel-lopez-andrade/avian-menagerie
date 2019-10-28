class BirdColorsBreed < ApplicationRecord
  belongs_to :bird_color
  belongs_to :breed
end
