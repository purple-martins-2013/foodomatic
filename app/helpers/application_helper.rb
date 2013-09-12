module ApplicationHelper

  include FoundationRailsHelper::FlashHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def recipe_renderer(recipe)
    RecipeRenderer.new(current_user, recipe)
  end

  def render_recipe_detail(recipe)
    render partial: recipe_renderer(recipe).detail_partial, locals: { recipe: recipe }
  end

  def classes_for_recipe(recipe)
    if current_user

      classes = []
      if current_user.in_basket?(recipe)
        classes << 'basketed-recipe'
      end

      if current_user.in_favorites?(recipe)
        classes << 'favorite-recipe'
      end

      return classes.join(' ')

    end
  end
  
end
