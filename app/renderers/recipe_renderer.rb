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


  def button_partials
    button_partials = []
    if @user.in_basket?(@recipe)
      button_partials.push 'recipes/manage_in_basket_button'
    else
      button_partials.push 'recipes/add_to_basket_button'
    end

    if @user.in_favorites?(@recipe)
      button_partials.push 'recipes/remove_from_favorites_button'
    else
      button_partials.push 'recipes/add_to_favorites_button'
    end

    return button_partials
  end

end
