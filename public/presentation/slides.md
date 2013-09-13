!SLIDE
hello.

!SLIDE
![logo](images/sugar_snap.png)
# Grocer Ease
Dan Hossom | Jeremy Sell | Leslie Lai | Martino Visintin

!SLIDE
## The problem
Cooking is fun. Figuring out and getting the ingredients you need is not.

!SLIDE
## The solution
Grocer Ease. Choose recipes you want to cook. Click a button. Get the
ingredients you need delivered to your door.

!SLIDE
## Except that...
* Instacart does not have an API (and building the scraping would take
  more than a week)
* TaskRabbit's API is not accepting new registrations `ಠ_ಠ`

!SLIDE
## Adjusting Strategy
* Let's focus on what we can build _now_
  - Finding recipes
  - Automating grocery list generation

!SLIDE
# Demo.

!SLIDE
![badge](images/badges.png)
## The problem
Give the user feedback when she adds a recipe to her favorites or her
basket.

!SLIDE
## The solution
Badge icon that catches the users attention through
bouncing quickly.

!SLIDE
```javascript
function bindAddTo(destination, badge) {
    $('.add-to-' + destination).on('click', function(e) {
      e.preventDefault();
      var recipeContainer = $(this).closest('.recipe-container');
      badge.add($(this).attr('href'), recipeContainer);
    });
  }
 
  function bindRemoveFrom(destination, badge) {
    $('.remove-from-' + destination).on('click', function(e) {
      e.preventDefault();
      var recipeContainer = $(this).closest('.recipe-container');
      badge.remove($(this).attr('href'), recipeContainer);
    });
  };
```

!SLIDE
## Except that...
- Even after refactoring it was getting out of hand.
- Make a `Badge` class

!SLIDE
### `Badge` 
```javascript
function Badge(destination) {
  this.destination = destination;
  var self = this;
 
  this.refresh().done(function(itemCount) {
    self.render(itemCount);
  });
}
 
Badge.prototype.render = function(itemCount, options) {
  options = options || {}
  var $destinationLink = $('#' + this.destination + '-link');
  if (itemCount === 0) {
    $destinationLink.find('.badger-outter').remove();
  } else {
    var newCount = itemCount.toString();
    $destinationLink.badger(newCount);
    if (options.bounce) {
      $destinationLink
        .stop()
        .effect('bounce', {times: 1}, "fast");
    }
  }
}
```

!SLIDE
## The feature
Signing in users through Facebook

!SLIDE
## The solution
OmniAuth with Devise

!SLIDE
## Recipe Search
```ruby
class RecipesController < ApplicationController
  def search
    @recipes = Recipe.where("lower(title) like ?",
      "%#{params[:search].downcase}%)
  end
end
```

!SLIDE
## Refactoring Search 1
Re-use index route instead of creating a new route and view
```ruby
  def index
    @recipes = Recipe.search(params[:search])
  end
```

!SLIDE
## Refactoring Search 2
Move logic to the `Recipe` model
```ruby
class Recipe < ActiveRecord::Base
  def self.search(search)
    if search
      num_terms = search.split.length
      query = (['title ILIKE ?'] * num_terms).join(' AND ')
      Recipe.where(
        [query] +
        search.split.map { |term| "%#{term}%" })
    else
      Recipe.all
    end
  end
end
```

- Use `ILIKE` instead of `lower` and `downcase` 
- Accommodate multiple search terms
- Return all recipes if no search term

!SLIDE
![recipe partial](images/_recipe.png)
## The problem
Displaying the right buttons to manage recipes

!SLIDE
* The `_recipe` partial is used in several views:
  - index
  - basket
  - favorites
* Different buttons depending on recipe status 

!SLIDE
### Basketed Recipe:
![basketed recipe](images/_basketed.png)
(Look at the buttons, not at the food porn)

!SLIDE
### Favorite Recipe:
![favorite recipe](images/_favorited.png)

!SLIDE
### Basketed and Favorite Recipe:
![basketed and favorited recipe partial](images/_favorited+basketed.png)

!SLIDE
## The solution

!SLIDE
### `RecipeRenderer`, the first attempt
- split every button in its own partial
- load needed partials according to the recipe status

!SLIDE code
### `Renderer#button_partials`
```ruby
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
```

!SLIDE
### Except that...
what about updating buttons on `ajax:success`?!

!SLIDE
### CSS to the rescue
- render all the buttons every time (retire `RecipeRenderer`)
- show/hide buttons depending on the `HTML` class of the recipe
- `ajax:success` can just change the class of the recipe

!SLIDE code

#### Recipe view

```htmlembedded
<div class='recipe favorite'>
  <!-- delicious stuff -->
</div>
```

```sass
.controls
  .add-to-favorites-controls
    display: inline
  .remove-from-favorites-controls
    display: none

.favorite-recipe .controls
  .add-to-favorites-controls
    display: none
  .remove-from-favorites-controls
    display: inline
```
