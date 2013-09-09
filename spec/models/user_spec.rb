require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create :user
  end

  subject { @user }

  it { should have_many(:queued_recipes) }
  it { should have_many(:basketed_recipes) }

  describe '#in_basket?(recipe)' do

    before do
      @recipe = 'delicious recipe'
    end
    it 'returns false when the recipe is not in the basket' do
      @user.basket.stub(:include?) { false }
      expect(@user.in_basket?(@recipe)).to be_false
    end

    it 'returns true when the recipe is in the basket' do
      @user.basket.stub(:include?) { true }
      expect(@user.in_basket?(@recipe)).to be_true
    end

  end
end

