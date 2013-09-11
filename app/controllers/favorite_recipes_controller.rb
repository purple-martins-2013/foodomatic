class FavoriteRecipesController < ApplicationController
  def create
    current_user.favorite_recipes.create(recipe_id: params[:id])
    redirect_to favorites_count_items_path
  end

  def count_items
    if current_user
      item_count = current_user.favorite_recipes.count
    else
      item_count = 0
    end
    render json: { item_count: item_count }.to_json
  end

  def index
    @favorites = current_user.favorites.list
  end

  def destroy
    current_user.favorite_recipes.where(recipe_id: params[:id]).destroy_all
    redirect_to favorites_count_items_path
  end
end
