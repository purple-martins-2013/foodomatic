class BasketController < ApplicationController

  def show
    @basket = current_user.basket
  end


  def count_items

  end

  def add_to_basket
    recipe = Recipe.find(params[:recipe])
    current_user.add_to_basket(recipe)
    redirect_to basket_count_items_path
  end

end
