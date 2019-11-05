class AddDescriptionToCage < ActiveRecord::Migration[5.2]
  def change
    add_column :cages, :description, :text
  end
end
