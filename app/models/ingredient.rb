class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :product

  def name
    self.product.name
  end
end
