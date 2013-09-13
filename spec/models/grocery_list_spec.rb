require 'spec_helper'

describe GroceryList do
  let(:recipe1) { FactoryGirl.create(:recipe_with_ingredients) }
  let(:recipe2) { FactoryGirl.create(:recipe_with_ingredients) }
  let(:basket) { [recipe1, recipe2] }
  let(:grocery_list) { GroceryList.new(basket) }

  describe "#initialize" do
    it "requires 1 parameter" do
      expect { GroceryList.new }.to raise_error(ArgumentError)
    end
  end

  describe "#total" do
    it "calculates the total cost of all the recipes in the user's basket" do
      expect(grocery_list.total).to eq 15.00
    end
  end

  describe "#list" do
    context "when ingredients are unique" do
      it "returns a hash containing all the ingredients" do
        expect(grocery_list.list.length).to eq 10
      end
    end

    context "when there are duplicate ingredients" do
      let(:grocery_list) { GroceryList.new([recipe1, recipe1]) }

      it "aggregates ingredients from different recipes if they correspond to the same product" do
        expect(grocery_list.list.length).to eq 5
      end
    end
  end

  describe "#build_products_list" do
    before do
      @order = Order.new
    end

    it "requires 1 parameter" do
      expect { grocery_list.build_products_list }.to raise_error(ArgumentError)
    end

    it "makes a new ordered_product object for each ingredient in the grocery list" do
      expect { grocery_list.build_products_list(@order) }.to change { @order.ordered_products.size}.by(grocery_list.list.size)
    end
  end
end
