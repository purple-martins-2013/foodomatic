# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    unit_type "MyString"
    price "9.99"
    min_amount 1
  end
end
