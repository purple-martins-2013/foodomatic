class GroceryList 
  def initialize(basket)
    @basket = basket
  end

  def total
    total = 0
    @basket.each do |recipe|
      recipe.ingredients.each do |ingredient|
        total += ingredient.cost
      end
    end
    total
  end

  def list
    list = Hash.new(0)
    @basket.each do |recipe|
      recipe.ingredients.each do |ingredient|
        list[ingredient.product_id] += ingredient.amount_to_buy
      end
    end
    list
  end

  def build_products_list(order)
    list.each do | product_id, amount |
      order.ordered_products.build(
        quantity: amount.ceil,
        product_id: product_id
      )
    end
  end
end
