require 'spec_helper'

describe Recipe do

  before do
    @recipe = FactoryGirl.create :recipe
  end

  subject { @recipe }

  it { should respond_to :title }
  it { should respond_to :image_url }

end
