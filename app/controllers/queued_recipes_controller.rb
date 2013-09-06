class QueuedRecipesController < ApplicationController
  def create
    QueuedRecipe.create(
      user_id: current_user.id, 
      recipe_id: params[:recipe_id])
    redirect_to recipes_path
  end

  def index
    @queued_recipes = current_user.queued_recipes
  end
end
