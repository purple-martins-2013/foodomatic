class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :queued_recipes
  has_many :basketed_recipes

  def last_position
    queued_recipes.count + 1
  end

  # REFACTOR: a basket object
  # how do you make a non persisted object that belongs to the current user?
  def basket
    # REFACTOR: there probably is a better way to do this
    BasketedRecipe.includes(:recipe).where(user_id: self.id).map(&:recipe)
  end

  def add_to_basket(recipe)
    BasketedRecipe.create(user_id: self.id, recipe: recipe)
  end

  def total(basket)
    item_costs = []
    basket.each do |recipe|
      recipe.ingredients.each do |ingredient|
        item_costs << ingredient.amount_to_buy * ingredient.product.price
      end
    end
    item_costs.inject(:+)
  end

end
