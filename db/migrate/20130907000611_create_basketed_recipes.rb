class CreateBasketedRecipes < ActiveRecord::Migration
  def change
    create_table :basketed_recipes do |t|
      t.references :user
      t.references :recipe

      t.timestamps
    end
  end
end
