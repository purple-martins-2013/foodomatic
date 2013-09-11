require 'spec_helper'

describe RecipeRenderer do

  before do
    @recipe = FactoryGirl.create :recipe
  end

  let(:recipe_renderer) { RecipeRenderer.new(@user, @recipe) }

  describe '#detail_partial' do

    context 'when the user is signed in' do

      before do
        @user = FactoryGirl.create :user
      end

      it 'returns the signed in partial' do
        expect(recipe_renderer.detail_partial).to eq 'recipes/signed_in_recipe'
      end
    end

    context 'when the user is signed out' do

      before do
        @user = nil
      end

      it 'returns the signed out partial' do
        expect(recipe_renderer.detail_partial).to eq 'recipes/signed_out_recipe'
      end

    end

  end

  describe '#button_partials' do

    context 'when the user is signed in' do

      before do
        @user = FactoryGirl.create :user
      end

      context 'when recipe is in the basket' do
        before do
          @user.stub(:in_basket?) { true }
        end
        it 'returns the "manage in basket" button partial' do
          expect(recipe_renderer.button_partials).to include('recipes/manage_in_basket_button')
        end
        it 'does *not* return the "add to basket" button partial' do
          expect(recipe_renderer.button_partials).not_to include('recipes/add_to_basket_button')
        end
      end

      context 'when recipe is *not* in the basket' do
        before do
          @user.stub(:in_basket?) { false }
        end
        it 'does *not* return the "manage in basket" button partial' do
          expect(recipe_renderer.button_partials).not_to include('recipes/manage_in_basket_button')
        end
        it 'returns the "add to basket" button partial' do
          expect(recipe_renderer.button_partials).to include('recipes/add_to_basket_button')
        end
      end

      context 'when recipe is in the favorites' do
        before do
          @user.stub(:in_favorites?) { true }
        end
        it 'returns the "remove from favorites" button partial' do
          expect(recipe_renderer.button_partials).to include('recipes/remove_from_favorites_button')
        end
        it 'does *not* return the "add to favorites" button partial' do
          expect(recipe_renderer.button_partials).not_to include('recipes/add_to_favorites_button')
        end
      end

      context 'when recipe is *not* in the favorites' do
        before do
          @user.stub(:in_favorites?) { false }
        end
        it 'does *not* return the "remove from favorites" button partial' do
          expect(recipe_renderer.button_partials).not_to include('recipes/remove_from_favorites_button')
        end
        it 'returns the "add to favorites" button partial' do
          expect(recipe_renderer.button_partials).to include('recipes/add_to_favorites_button')
        end
      end
    end

  end

end
