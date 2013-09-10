class IngredientsController < ApplicationController

  def create
    recipe = Recipe.find_by_id(ingredient_params[:recipe_id])
    ingredient = recipe.ingredients.build(ingredient_params)
    if ingredient.save
      render json: ingredient.to_json
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:recipe_id, :product_id, :required_amount)
  end

end
