class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :favorite_recipes
  has_many :basketed_recipes

  def last_position
    favorite_recipes.count + 1
  end

  def basket
    @basket ||= Basket.new(self)
  end

  def favorites
    @favorites ||= Favorites.new(self)
  end

  def in_basket?(recipe)
    basket.include?(recipe)
  end

  def in_favorites?(recipe)
    favorites.include?(recipe)
  end

end
