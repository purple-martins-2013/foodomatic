class Favorites

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def list
    user.favorite_recipes.ordered.with_recipe.map(&:recipe)
  end

  def add(recipe)
    @user.favorite_recipes.create(recipe: recipe)
  end

  def include?(recipe)
    list.include?(recipe)
  end

end
