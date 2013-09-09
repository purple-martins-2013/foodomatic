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
        it 'returns only the "add to queue" button partial' do
          @user.stub(:in_basket?) { true }
          @user.stub(:in_queue?) { false }
          expect(recipe_renderer.button_partials).to eq ['recipes/add_to_queue_button']
        end
      end

      context 'when recipe is in the queue' do
        it 'returns only the "add to basket" button partial' do
          @user.stub(:in_queue?) { true }
          @user.stub(:in_basket?) { false }
          expect(recipe_renderer.button_partials).to eq ['recipes/add_to_basket_button']
        end
      end

      context 'when recipe is neither in the basket nor in the queue' do
        it 'returns both the "add to basket" and "add to queue" button partials' do
          @user.stub(:in_basket?) { false }
          @user.stub(:in_queue?) { false }

          expected_partials = ['recipes/add_to_basket_button', 'recipes/add_to_queue_button']
          expect(recipe_renderer.button_partials).to eq expected_partials
        end
      end
    end

  end

end
