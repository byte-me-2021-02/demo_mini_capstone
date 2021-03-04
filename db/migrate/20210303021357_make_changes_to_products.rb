class MakeChangesToProducts < ActiveRecord::Migration[6.1]
  def change
    # change description to text
    change_column :products, :description, :text
    # change price to a decimal
    change_column :products, :price, :decimal, precision: 6, scale: 2
    # add quantity
    add_column :products, :quantity, :integer
  end
end
