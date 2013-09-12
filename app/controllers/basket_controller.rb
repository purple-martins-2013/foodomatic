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

  def count_items
    if current_user
      item_count = current_user.basket.size
    else
      item_count = 0
    end
    render json: { item_count: item_count }.to_json
  end

  def add_to_basket
    recipe = Recipe.find(params[:id])
    current_user.basket.add(recipe)
    redirect_to basket_count_items_path
  end

end
