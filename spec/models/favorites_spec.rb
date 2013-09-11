require 'spec_helper'

describe Favorites do

  let(:recipe) { FactoryGirl.create :recipe }
  
  before do
    @user = User.create(email: 'user@email.com', password: 'password', password_confirmation: 'password')
    @favorites = @user.favorites
  end

  describe "#list" do

    context "when user has no favorite recipes" do
      it "returns an empty array" do
        expect(@favorites.list).to eq []
      end
    end

    context "when user has a favorite recipe" do
      
      before do
        FavoriteRecipe.create(user: @user, recipe: recipe)
      end

      it "returns the user's favorite recipe" do
        expect(@favorites.list).to eq [recipe]
      end
    end
  end

  describe "#add" do

    it "should add a recipe to the basket" do
      expect { @favorites.add(recipe) }.to change {@favorites.list.size}.by 1
    end

    it "adds the right recipe to the basket" do
      @favorites.add(recipe)
      expect(@favorites.list).to include(recipe)
    end
  end
end