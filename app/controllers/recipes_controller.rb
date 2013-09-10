class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to edit_recipe_path(recipe)
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if(@recipe.update(recipe_params))
      redirect_to recipes_path, notice: 'Recipe saved'
    else
      render action: 'edit'
    end

  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :image_url)
  end

end
