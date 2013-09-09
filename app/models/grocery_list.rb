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
end
