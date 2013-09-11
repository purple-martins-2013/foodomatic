class CreateOrderedProducts < ActiveRecord::Migration
  def change
    create_table :ordered_products do |t|
      t.references :order
      t.references :product

      t.timestamps
    end
  end
end
