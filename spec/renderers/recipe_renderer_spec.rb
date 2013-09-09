require 'spec_helper'

describe RecipeRenderer do

  before do
    @user = FactoryGirl.create :user
    @recipe = FactoryGirl.create :recipe
    @recipe_renderer = RecipeRenderer.new(user, recipe)
  end

  describe '#detail_partial' do

    context 'when the user is signed in' do
      before do
        sign_in @user
      end

      it 'returns the signed in partial' do
        expect(@recipe_renderer.detail_partial).to eq 'recipes/signed_in_recipe'
      end
    end

    context 'when the user is signed out' do
      it 'returns the signed out partial' do
        expect(@recipe_renderer.detail_partial).to eq 'recipes/signed_out_recipe'
      end
    end

  end

  describe '#button_partials' do

    context 'when the user is signed in' do
      context 'when recipe is in the basket' do
        it 'returns only the add to queue partial'
      end

      context 'when recipe is in the queue' do
        it 'returns only the add to basket partial'
      end

      context 'when recipe is in neither the basket nor the queue' do
        it 'returns both the add to basket and add to queue partials'
      end
    end

  end

end
