class Basket

  def initialize(user)
    @user = user
  end

  def list
    @user.basketed_recipes.includes(:recipe).map(&:recipe)
  end

  def add(recipe)
    @user.basketed_recipes.create(recipe: recipe)
  end

  def remove(recipe)
    @user.basketed_recipes.where(recipe_id: recipe).first.try(:destroy)
  end

  def size
    list.size
  end

  def include?(recipe)
    list.include?(recipe)
  end

  def clear
    @user.basketed_recipes.destroy_all
  end

end
