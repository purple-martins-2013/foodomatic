require 'spec_helper'

describe RecipesController do

  describe '#index' do
    it 'should fetch all the recipes' do
      recipe = FactoryGirl.create :recipe
      get :index
      expect(assigns(:recipes)).to eq Recipe.all
    end
  end
end
