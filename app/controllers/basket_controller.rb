class BasketController < ApplicationController

  def show
    @basket = current_user.basket.list
    @grocery_list = GroceryList.new(@basket)
    @order = Order.new
    @grocery_list.build_products_list(@order)
  end

  def add_to_basket
    recipe = Recipe.find(params[:id])
    current_user.basket.add(recipe)
    render json: count_basket_items.merge(recipe_in_basket?(recipe)).to_json
  end

  def remove_from_basket
    recipe = Recipe.find(params[:id])
    current_user.basket.remove(recipe)
    render json: count_basket_items.merge(recipe_in_basket?(recipe)).to_json
  end

  def count_items
    render json: count_basket_items.to_json
  end

  private

  def count_basket_items
    if current_user
      item_count = current_user.basket.size
    else
      item_count = 0
    end
    return { container_type: 'basketed-recipe', item_count: item_count }
  end

  def recipe_in_basket?(recipe)
    { item_in_basket: current_user.in_basket?(recipe) }
  end

end
