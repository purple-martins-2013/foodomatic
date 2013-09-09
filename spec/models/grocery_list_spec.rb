require 'spec_helper'

describe GroceryList do
  let(:recipe1) { FactoryGirl.create(:recipe_with_ingredients) }
  let(:recipe2) { FactoryGirl.create(:recipe_with_ingredients) }
  let(:basket) { [recipe1, recipe2] }
  let(:grocery_list) { GroceryList.new(basket) }

  describe "initialize" do
    it "requires 1 parameter" do
      expect { GroceryList.new }.to raise_error(ArgumentError)
    end
  end

  describe "total" do
    it "calculates the total cost of all the recipes in the user's basket" do
      expect(grocery_list.total).to eq 19.98
    end
  end

  describe "list" do
    it "aggregates ingredients from different recipes if they correspond to the same product"
  end

end
