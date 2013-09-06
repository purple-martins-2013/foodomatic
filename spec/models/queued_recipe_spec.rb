require 'spec_helper'

describe QueuedRecipe do

  before do
    @queued_recipe = QueuedRecipe.new
  end

  subject { @queued_recipe }

  it { should belong_to :user }
  it { should belong_to :recipe }

end
