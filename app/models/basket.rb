class Basket

  def initialize(user)
    @user = user
  end

  def list
    BasketedRecipe.includes(:recipe).where(user_id: @user.id).map(&:recipe)
  end

  def add(recipe)
    BasketedRecipe.create(user_id: @user.id, recipe: recipe)
  end

end
