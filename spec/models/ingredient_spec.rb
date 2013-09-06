require 'spec_helper'

describe Ingredient do
  before do
    @ingredient = FactoryGirl.create :ingredient
  end

  subject { @ingredient }

  it { should belong_to :recipe }
  it { should belong_to :product }

end
