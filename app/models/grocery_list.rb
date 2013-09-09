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
end
