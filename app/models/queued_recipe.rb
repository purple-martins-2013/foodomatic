class QueuedRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  before_save :set_priority

  def set_priority
    self.priority = self.user.next_priority
  end
end
