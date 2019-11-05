class CreateForumPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_posts do |t|
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
