class CreateCageVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :cage_varieties do |t|
      t.string :name

      t.timestamps
    end
  end
end
