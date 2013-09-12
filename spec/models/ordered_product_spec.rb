require 'spec_helper'

describe OrderedProduct do
  before do
    @product = FactoryGirl.create :product
    @ordered_product = OrderedProduct.new(product: @product, quantity: 2)
  end

  subject { @ordered_product }

  it { should belong_to :product }
  it { should belong_to :order }

  describe "#name" do
    it "returns the product's name" do
      expect(@ordered_product.name).to eq @product.name
    end
  end

  describe "#cost" do
    it "returns the product of the quantity and the product's price" do
      expect(@ordered_product.cost).to eq 3
    end
  end

  describe "#price" do
    it "returns the product's price" do
      expect(@ordered_product.price).to eq @product.price
    end
  end
end
