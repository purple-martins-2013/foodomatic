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
  'http://i.imgur.com/p4HnQd8.jpg',
  'http://i.imgur.com/fWzSE.jpg',
  'http://i.imgur.com/i3kUJ.jpg',
  'http://i.imgur.com/aG03T.jpg',
  'http://i.imgur.com/TQ9P03b.jpg',
  'http://bakecrumbs.files.wordpress.com/2013/07/ccjupitercake08.jpg',
  'http://i.imgur.com/RiY8Llk.jpg',
  'http://i.imgur.com/HNKuBK5.jpg',
  'http://i.imgur.com/D0zIAxC.jpg',
  'http://i.imgur.com/gU2Bdn2.jpg',
  'http://i.imgur.com/ZTGqigb.jpg',
  'http://blog.hostthetoast.com/wp-content/uploads/2013/01/Can-Cakes-0443.jpg',
  'http://i.imgur.com/6LOAp.jpg',
  'http://i.imgur.com/0YYEZqp.jpg',
  'http://i.imgur.com/5dONz.jpg',
  'http://i.imgur.com/Yrp9nZu.jpg',
  'http://i.imgur.com/CeeHIIm.jpg',
  'http://i.imgur.com/EZh81wU.jpg',
  'http://i.imgur.com/J9DLQ.jpg',
  'http://i.imgur.com/6moxCeT.jpg',
  'http://i.imgur.com/C45KqGY.jpg',
  'http://i.imgur.com/F6S1p.jpg',
  'http://i.imgur.com/gP3nb6n.jpg',
  'http://i.imgur.com/avBDsUn.jpg',
  'http://i.imgur.com/CZLh2tI.jpg',
  'http://i.imgur.com/8nuolGP.jpg#.UVIfdXvd27k.reddit',
]

FactoryGirl.define do
  factory :recipe do
    sequence :title do |n|
      "Steak #{n}"
    end

    image_url(food_porn_urls.shuffle!.pop || "http://placehold.it/500x500&text=Steak_#{n}")

    factory :recipe_with_ingredients do
      after(:create) do |recipe|
        FactoryGirl.create_list(:ingredient, 5, recipe: recipe)
      end
    end
  end
end
