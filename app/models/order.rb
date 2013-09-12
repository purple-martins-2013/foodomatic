class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_products
  accepts_nested_attributes_for :ordered_products

  def to_s
    self.ordered_products.map do |ordered_products|
      "[ ]\t#{ordered_products.quantity}\t#{ordered_products.name}"
    end.join("\n")
  end
end
