class CreateCages < ActiveRecord::Migration[5.2]
  def change
    create_table :cages do |t|
      t.string :name
      t.references :cage_variety, foreign_key: true

      t.timestamps
    end
  end
end
