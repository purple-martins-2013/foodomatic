class OrdersController < ApplicationController

  def create
    @order = Order.create(order_params)
    current_user.basket.clear
    redirect_to recipes_path, notice: 'Order placed'
  end

  def show
    order = Order.where(user_id: current_user.id).last
    ordered_prod = OrderedProduct.where(order_id: order)
    products = Product.where(id: ordered_prod).pluck('name')
    quantity = OrderedProduct.where(order_id: order).pluck('quantity')
    @list = quantity.zip(products)
  end

  def update

  end

  private

  def order_params
    params.require(:order).permit(:total, :user_id, ordered_products_attributes: [:quantity, :product_id])
  end

end
