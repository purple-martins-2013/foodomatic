require 'spec_helper'

describe RecipesController do

  describe '#index' do
    it 'should fetch all the recipes' do
      recipe = FactoryGirl.create :recipe
      get :index
      expect(assigns(:recipes)).to eq Recipe.all
    end
  end

  describe '#create' do
    it 'should redirect to the recipe edit page' do
      recipe_args = FactoryGirl.attributes_for :recipe
      post :create, { recipe: recipe_args }
      expect(response).to redirect_to edit_recipe_path(Recipe.last)
    end
  end
end
