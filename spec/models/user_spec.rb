require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create :user
  end

  subject { @user }

  it { should have_many(:queued_recipes) }
  it { should have_many(:basketed_recipes) }

  describe '#basket' do
    context 'with an empty basket' do
      it 'should return an empty list' do
        expect(@user.basket).to eq []
      end
    end

    context 'with some recipes in the basket' do
      before do
        @recipe = FactoryGirl.create :recipe
        FactoryGirl.create(:basketed_recipe, user: @user, recipe: @recipe)
      end
      it 'should return a list of Recipes (that are in the basket)' do
        expect(@user.basket).to eq [@recipe]
      end
    end
  end

end

