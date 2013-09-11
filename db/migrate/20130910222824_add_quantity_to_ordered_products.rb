class AddQuantityToOrderedProducts < ActiveRecord::Migration
  def change
    add_column :ordered_products, :quantity, :integer
  end
end
