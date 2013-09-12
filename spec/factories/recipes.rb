food_porn_urls = [
  'http://i.imgur.com/Su2lQ3B.jpg',
  'http://blog.hostthetoast.com/wp-content/uploads/2013/09/8-30-13-070.jpg',
  'http://31.media.tumblr.com/27fc9328b1b7d915ffdc30d67f789420/tumblr_mezlo6kYnZ1rslfxoo1_500.jpg',
  'http://farm3.staticflickr.com/2849/9729531511_cd23815119_b.jpg',
  'http://i.imgur.com/DZuH6FH.jpg',
  'http://farm6.staticflickr.com/5496/9730454498_8fba7dbb2f_h.jpg',
  'http://i.imgur.com/IWUnZR6.jpg',
  'http://i.imgur.com/e6I642S.jpg',
  'http://i.imgur.com/zE0WXFG.jpg',
  'http://i.imgur.com/oPLXjDn.jpg',
  'http://i.imgur.com/7ekD0Kq.jpg',
  'http://i.imgur.com/AKMPeEC.jpg',
  'http://thevegetarianginger.files.wordpress.com/2013/03/dsc1251.jpg',
  'http://i.imgur.com/RhtK0ZY.jpg',
  'http://farm8.staticflickr.com/7319/9716454028_5c1ebfc08d_k.jpg',
  'http://i.imgur.com/MQWF6Re.jpg',
]

FactoryGirl.define do
  factory :recipe do
    sequence :title do |n|
      "Steak #{n}"
    end

    sequence :image_url do |n|
      # "http://placehold.it/500x500&text=Steak_#{n}"
      food_porn_urls.sample
    end

    factory :recipe_with_ingredients do
      after(:create) do |recipe|
        FactoryGirl.create_list(:ingredient, 5, recipe: recipe)
      end
    end
  end
end
