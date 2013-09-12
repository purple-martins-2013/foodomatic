class BasketController < ApplicationController

  def show
    @basket = current_user.basket.list
    @grocery_list = GroceryList.new(@basket)
    @order = Order.new

    @grocery_list.list.each do |product_id, amount|
      @order.ordered_products.build(quantity: amount.ceil, product_id: product_id)
    end

    @order.total = @grocery_list.total
    @order.user = current_user
  end

  def add_to_basket
    recipe = Recipe.find(params[:id])
    current_user.basket.add(recipe)
    render json: count_basket_items
  end

  def remove_from_basket
    recipe = Recipe.find(params[:id])
    current_user.basket.remove(recipe)
    render json: count_basket_items
  end

  def count_items
    render json: count_basket_items
  end

  private

  def count_basket_items
    if current_user
      item_count = current_user.basket.size
    else
      item_count = 0
    end
    return { item_count: item_count }.to_json
  end

end
