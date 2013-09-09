class RenameQueuedRecipesToFavoriteRecipes < ActiveRecord::Migration
  def change
    rename_table :queued_recipes, :favorite_recipes
  end
end
