class FavoriteRecipesController < ApplicationController
  def create
    recipe = Recipe.find(params[:id])
    current_user.favorite_recipes.create(recipe_id: params[:id])
    render json: favorites_count.merge(recipe_in_favorites?(recipe)).to_json
  end

  def index
    @favorites = current_user.favorites.list
  end

  def destroy
    recipe = Recipe.find(params[:id])
    current_user.favorite_recipes.where(recipe_id: params[:id]).destroy_all
    render json: favorites_count.merge(recipe_in_favorites?(recipe)).to_json
  end

  def count_items
    render json: favorites_count.to_json
  end

  private

  def favorites_count
    if current_user
      item_count = current_user.favorite_recipes.count
    else
      item_count = 0
    end
    return { container_type: 'favorite-recipe', item_count: item_count }
  end

  def recipe_in_favorites?(recipe)
    { item_in_basket: current_user.in_favorites?(recipe) }
  end
end
