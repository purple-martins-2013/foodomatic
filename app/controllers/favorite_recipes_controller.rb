class FavoriteRecipesController < ApplicationController
  def create
    current_user.favorite_recipes.create(recipe_id: params[:id])
    redirect_to favorites_count_items_path
  end

  def count_items
    item_count = current_user.favorites.list.count
    render json: { item_count: item_count }.to_json
  end

  def index
    @favorites = current_user.favorites.list
  end

  def destroy
    recipe = current_user.favorite_recipes.find_by(recipe_id: params[:id])
    FavoriteRecipe.find(recipe.id).destroy
    redirect_to favorites_count_items_path
  end
end
