require 'spec_helper'

describe Product do
  before do
    @product = FactoryGirl.create(:product)
  end

  subject { @product }
  it { should respond_to :name }
  it { should respond_to :amount_type }
  it { should respond_to :price }
  it { should respond_to :min_amount }
  it { should have_many(:recipes).through(:ingredients) }

  describe "#name_with_amount_type" do
    it "returns a string containing the product name and amount type" do
      expect(@product.name_with_amount_type).to eq @product.name + " (" + @product.amount_type + ")"
    end
  end
end
