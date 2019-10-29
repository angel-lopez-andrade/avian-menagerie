class User < ApplicationRecord
    has_many :birds
    has_one_attached :pic
end
