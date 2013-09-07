require 'spec_helper'

describe BasketedRecipe do
  before do
    @basketed_recipe = FactoryGirl.create :basketed_recipe
  end

  subject { @basketed_recipe }

  it { should belong_to :user }
  it { should belong_to :recipe }

end
