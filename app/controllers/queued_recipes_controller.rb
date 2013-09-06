class QueuedRecipesController < ApplicationController
  def create
    QueuedRecipe.create(
      user_id: params[:user_id], 
      recipe_id: params[:recipe_id])
    redirect_to recipes_path
  end
end
