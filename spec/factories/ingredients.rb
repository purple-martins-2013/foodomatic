FactoryGirl.define do
  factory :ingredient do

    required_amount 1

    recipe
    product
  end
end
