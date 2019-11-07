class ForumPost < ApplicationRecord
  belongs_to :user
  belongs_to :breed
  validates :body, presence: true
  # prevents empty post submissions from going through, server-side
  # generates error messages and attaches to forum_post instance if unsuccessful?
end
