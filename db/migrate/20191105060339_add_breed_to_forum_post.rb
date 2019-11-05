class AddBreedToForumPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :forum_posts, :breed, foreign_key: true
  end
end
