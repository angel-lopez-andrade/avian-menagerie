class Bird < ApplicationRecord
  belongs_to :breed
  belongs_to :user
end
