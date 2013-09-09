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
    @basket ||= Basket.new(self)
  end

  def in_basket?(recipe)
    basket.include?(recipe)
  end

  def in_queue?(recipe)
    # REFACTOR: move into Q object
    QueuedRecipe.includes(:recipe).where(user_id: self.id, recipe_id: recipe.id).any?
  end

end
