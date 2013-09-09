require 'spec_helper'

describe Basket do

  before do
    @user = User.create(email: 'vise890@fooo.com', password: 'password', password_confirmation: 'password')
    @basket = @user.basket
  end

  describe '#list' do

    context 'with an empty basket' do
      it 'should return an empty list' do
        expect(@basket.list).to eq []
      end
    end

    context 'with some recipes in the basket' do

      before do
        @recipe = FactoryGirl.create :recipe
        FactoryGirl.create(:basketed_recipe, user: @user, recipe: @recipe)
      end

      it 'should return a list of Recipes (that are in the basket)' do
        expect(@basket.list).to eq [@recipe]
      end
    end
  end

  describe "#add" do

    before do
      @recipe = FactoryGirl.create :recipe
    end

    it "should add a recipe to the basket" do
      expect { @basket.add(@recipe) }.to change {@basket.size}.by 1
    end

    it "adds the right recipe to the basket" do
      @basket.add(@recipe)
      expect(@basket.list).to include(@recipe)
    end

  end

end
