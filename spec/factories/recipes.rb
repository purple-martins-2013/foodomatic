# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    sequence :title do |n|
      "Steak #{n}"
    end

    sequence :image_url do |n|
      "http://placehold.it/500x500&text=#{n}"
    end

    factory :recipe_with_ingredients do
      after(:create) do |recipe|
        FactoryGirl.create_list(:ingredient, 5, recipe: recipe)
      end
    end
  end
end
