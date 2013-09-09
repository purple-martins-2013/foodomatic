FactoryGirl.define do
  factory :ingredient do

    sequence :required_amount

    recipe
    product
  end
end
