require 'uri'

class Recipe < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :image_url, presence: true
  validates :image_url, format: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  has_many :queued_recipes
  has_many :users, through: :queued_recipes
end
