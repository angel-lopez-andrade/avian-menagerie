class AddPriceToCage < ActiveRecord::Migration[5.2]
  def change
    add_column :cages, :price, :integer
  end
end
