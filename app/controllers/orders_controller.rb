class OrdersController < ApplicationController

  def create
    @order = Order.create(order_params)
    if order_params[:total]
      current_user.basket.clear
      redirect_to recipes_path, notice: 'Order placed'
    else
      render action: 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:total, :user_id, ordered_products_attributes: [:quantity, :product_id])
  end
end
