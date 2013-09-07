# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :basketed_recipe do
    user
    recipe
  end
end
