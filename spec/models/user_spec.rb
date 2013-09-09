require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create :user
  end

  subject { @user }

  it { should have_many(:queued_recipes) }
  it { should have_many(:basketed_recipes) }
end

