require 'uri'

class Recipe < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :image_url, presence: true
  validates :image_url, format: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  has_many :favorite_recipes
  has_many :basketed_recipes

  has_many :ingredients
  has_many :products, through: :ingredients

  def self.search(search)
    if search
      Recipe.where("lower(title) like ?", "%#{search.downcase}%")
    else
      Recipe.all
    end
  end
end
