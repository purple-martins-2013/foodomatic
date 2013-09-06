require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create :user
  end

  subject { @user }

  it { should have_many(:recipes).through(:queued_recipes) }

end
