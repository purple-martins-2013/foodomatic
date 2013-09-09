require 'spec_helper'

describe Ingredient do
  before do
    @ingredient = FactoryGirl.create :ingredient
  end

  subject { @ingredient }

  it { should belong_to :recipe }
  it { should belong_to :product }

  describe "cost" do
    it "calculates the cost of buying the required amount of the ingredient" do
      expect(@ingredient.cost).to eq 1.50
    end
  end

  describe "amount_to_buy" do
    let(:product) { FactoryGirl.create(:product, min_amount: 3)}
    let(:ingredient) { FactoryGirl.create(:ingredient, required_amount: 6, product: product) }

    it "calculates the minimum number of units of a product needed to supply the required amount of the ingredient" do
        expect(ingredient.amount_to_buy).to eq 2
    end
  end
end
