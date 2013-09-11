require 'spec_helper'

describe OrderedProduct do
  before do
    @ordered_product = OrderedProduct.new
  end

  subject { @ordered_product }

  it { should belong_to :product }
  it { should belong_to :order }
end
