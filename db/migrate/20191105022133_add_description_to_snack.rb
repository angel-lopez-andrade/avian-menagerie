class AddDescriptionToSnack < ActiveRecord::Migration[5.2]
  def change
    add_column :snacks, :description, :text
  end
end
