class Breed < ApplicationRecord
    has_many :bird_colors_breeds
    has_many :bird_colors, through: :bird_colors_breeds
    has_many :birds
    has_one_attached :pic
    has_many :forum_posts
end
