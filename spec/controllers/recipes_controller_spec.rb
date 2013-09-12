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
      p recipe_args = FactoryGirl.attributes_for(:recipe)
      post :create, { recipe: recipe_args }
      expect(response).to redirect_to edit_recipe_path(Recipe.last)
    end
  end

  describe '#edit' do

    before do
      @recipe = FactoryGirl.create :recipe
      get :edit, { id: @recipe.id }
    end

    it 'makes all the products available to the view' do
      expect(assigns(:products)).to eq Product.all
    end

    it 'renders the right template' do
      expect(response).to render_template 'edit'
    end

  end

end
