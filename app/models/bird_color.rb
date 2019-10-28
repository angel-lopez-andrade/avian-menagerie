class BirdColor < ApplicationRecord
    has_many :bird_colors_breeds
    has_many :breeds, through: :bird_colors_breeds
end
