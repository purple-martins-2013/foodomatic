class FavoriteRecipesController < ApplicationController
  def create
    FavoriteRecipe.create(
      user: current_user,
      recipe_id: params[:recipe_id])
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
    @favorite_recipes = FavoriteRecipe.where(user: current_user).order('position ASC')
  end

  def sort
    @favorite_recipes = FavoriteRecipe.where(user: current_user)

    @favorite_recipes.each do |favorite_recipe|
      favorite_recipe.position = params['favorite_recipe'].index(favorite_recipe.id.to_s) + 1
      favorite_recipe.save
    end

    render nothing: true
  end

  def destroy
    FavoriteRecipe.find(params[:id]).destroy
    redirect_to favorites_count_items_path
  end
end
