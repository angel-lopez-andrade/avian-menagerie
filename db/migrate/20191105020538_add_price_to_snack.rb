class AddPriceToSnack < ActiveRecord::Migration[5.2]
  def change
    add_column :snacks, :price, :integer
  end
end
