require 'spec_helper'

describe IngredientsController do

  describe '#create' do

    before do
      @recipe = FactoryGirl.create :recipe
      @product = FactoryGirl.create :product
    end

    it 'adds the right ingredient to the right recipe' do
      post :create, { recipe_id: @recipe.id, ingredient: { product_id: @product.id, required_amount: 10 }}
      expect(Ingredient.last.recipe).to eq @recipe
      expect(Ingredient.last.product).to eq @product
      expect(Ingredient.last.required_amount).to eq 10
    end

  end

end
