class ChangePriceTypeInMyTable < ActiveRecord::Migration[6.0]
  def change
    change_column :decks, :price, :float
  end
end
