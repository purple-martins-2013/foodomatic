class Product < ActiveRecord::Base

  has_many :ingredients
  has_many :recipes, through: :ingredients

  def name_with_amount_type
    "#{name} (#{amount_type})"
  end

end
