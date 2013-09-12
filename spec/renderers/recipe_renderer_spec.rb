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

end
