class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :required_amount
      t.references :recipe
      t.references :product
      t.timestamps
    end
  end
end
