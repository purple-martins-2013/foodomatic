class OrderedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def name
    self.product.name
  end

  def cost
    self.quantity * self.product.price
  end

end
