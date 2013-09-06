class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :amount_type
      t.decimal :price
      t.integer :min_amount

      t.timestamps
    end
  end
end
