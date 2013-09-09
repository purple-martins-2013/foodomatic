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
    unless @user.in_basket?(@recipe)
      button_partials.push 'recipes/add_to_basket_button'
    end
    unless @user.in_queue?(@recipe)
      button_partials.push 'recipes/add_to_queue_button'
    end
    return button_partials
  end

end
