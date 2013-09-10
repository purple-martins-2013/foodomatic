class FavoriteRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  scope :ordered, -> { order(:position) }
  scope :with_recipe, -> { includes(:recipe) }
  acts_as_list

  before_create :assign_position

  def assign_position
    self.position = self.user.last_position
  end
end
