# Read about factories at https://github.com/thoughtbot/factory_girl
grocery_item = [ 
  "tomato",
  "avocado",
  "ribeye",
  "butter",
  "sea salt",
  "garlic",
  "onion",
  "flour",
  "carrot",
  "quinoa",
  "apple",
  "feta cheese",
  "goat cheese",
  "olive oil",
  "pork shoulder",
  "black beans",
  "salsa",
  "mango",
  "asparagus",
  "broccolini",
  "mint",
  "tarragon",
  "chives",
  "cinnamon",
  "linguini",
  "bay leaf",
  "eggs",
  "olives",
  "lamb flank",
  "green dye",
  "sweet potatoes"
]



FactoryGirl.define do
  sequence :name do |n|
    grocery_item.shuffle.first
  end
  factory :product do
    name 
    amount_type "kilos"
    price "1.50"
    min_amount 1
  end
end
