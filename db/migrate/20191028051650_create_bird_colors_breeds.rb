class CreateBirdColorsBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :bird_colors_breeds do |t|
      t.references :bird_color, foreign_key: true
      t.references :breed, foreign_key: true

      t.timestamps
    end
  end
end
