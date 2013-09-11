require 'spec_helper'

describe Order do
  before do
    @order = Order.new
  end

  subject { @order }

  it { should belong_to :user }
  it { should have_many :ordered_products }
end
