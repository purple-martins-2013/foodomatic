class OrdersController < ApplicationController

  def create
    @order = Order.create(order_params)
    # redirect_to recipes_path, notice: 'Order placed'
  end

  private

  def order_params
    params.require(:order).permit(:total, :user_id, ordered_products_attributes: [:quantity, :product_id])
  end

end
