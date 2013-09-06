FactoryGirl.define do
  factory :ingredient do

    sequence :required_amount do |n|
      n
    end

    recipe
    product
  end
end
