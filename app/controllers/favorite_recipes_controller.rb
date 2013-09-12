class FavoriteRecipesController < ApplicationController
  def create
    current_user.favorite_recipes.create(recipe_id: params[:id])
    render json: favorites_count
  end

  def index
    @favorites = current_user.favorites.list
  end

  def destroy
    current_user.favorite_recipes.where(recipe_id: params[:id]).destroy_all
    render json: favorites_count
  end

  def count_items
    render json: favorites_count
  end

  private

  def favorites_count
    if current_user
      item_count = current_user.favorite_recipes.count
    else
      item_count = 0
    end
    return { item_count: item_count }.to_json
  end

end
