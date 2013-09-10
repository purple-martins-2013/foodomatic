class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe_edit_path recipe
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    parms.require(:recipe).permit(:title, :image_url)
  end

end
