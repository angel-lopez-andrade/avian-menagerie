class CreateSnacks < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks do |t|
      t.string :name
      t.references :snack_variety, foreign_key: true

      t.timestamps
    end
  end
end
