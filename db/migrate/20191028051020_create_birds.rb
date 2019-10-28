class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :name
      t.integer :age
      t.integer :price
      t.string :color
      t.text :description
      t.references :breed, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
