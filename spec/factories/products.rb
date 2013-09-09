# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "Product #{n}"
  end
  factory :product do
    name
    amount_type "kilos"
    price "1.50"
    min_amount 1
  end
end
