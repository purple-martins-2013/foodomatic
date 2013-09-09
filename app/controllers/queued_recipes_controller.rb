class QueuedRecipesController < ApplicationController
  def create
    QueuedRecipe.create(
      user: current_user,
      recipe_id: params[:recipe_id])
    redirect_to queue_count_items_path
  end

  def count_items
    item_count = current_user.queued_recipes.count
    render json: { item_count: item_count }.to_json
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

  def destroy
    QueuedRecipe.find(params[:id]).destroy
    redirect_to queued_recipes_path
  end
end
