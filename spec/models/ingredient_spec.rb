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
      expect(@ingredient.cost).to eq 9.99
    end
  end

  describe "amount_to_buy" do
    it "calculates the minimum number of units of a product needed to supply the required amount of the ingredient" do
      test_dataset = [ [10, 3, 4],
                       [10, 4, 3],
                       [10, 10, 1],
                       [10, 30, 1] 
                     ]

      test_dataset.each do |required_amount, min_amount, amount_to_buy|
        @product = Product.create(min_amount: min_amount)
        @ingredient = Ingredient.create(required_amount: required_amount, product: @product)

        expect(@ingredient.amount_to_buy).to eq amount_to_buy
      end
    end
  end
end
