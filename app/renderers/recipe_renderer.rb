class RecipeRenderer

  def initialize(user, recipe)
    @user = user
    @recipe = recipe
  end

  def detail_partial
    if @user
      'recipes/signed_in_recipe'
    else
      'recipes/signed_out_recipe'
    end
  end

end
