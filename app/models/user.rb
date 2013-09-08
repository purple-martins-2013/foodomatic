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

  def basket
    # REFACTOR: there probably is a better way to do this
    BasketedRecipe.includes(:recipe).where(user_id: self).map(&:recipe)
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
