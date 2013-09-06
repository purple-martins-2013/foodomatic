class CreateQueuedRecipes < ActiveRecord::Migration
  def change
    create_table :queued_recipes do |t|
      t.integer :priority
      t.references :user
      t.references :recipe

      t.timestamps
    end
  end
end
