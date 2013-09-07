class QueuedRecipesController < ApplicationController
  def create
    QueuedRecipe.create(
      user: current_user, 
      recipe_id: params[:recipe_id])
    render json: { queued_recipes_count: QueuedRecipe.count }.to_json
  end

  def index
    @queued_recipes = QueuedRecipe.where(user: current_user).order('position ASC')
  end

  def sort
    @queued_recipes = QueuedRecipe.where(user: current_user)

    @queued_recipes.each do |qr|
      qr.position = params['qr'].index(qr.id.to_s) + 1
      qr.save
    end

    render nothing: true
  end
end
