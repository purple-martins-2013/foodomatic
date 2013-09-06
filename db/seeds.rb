recipe = { 'Ketchup, Mustard Dog' => 'http://i-cdn.apartmenttherapy.com/ol-images/la/uploads/092806canstruct1.jpg',
           'Beef, Butter and Rosemary' => 'http://thesuiteworld.com/wp-content/uploads/2012/09/mastros-bone-in-ribeye-best-steak-steakhouse.jpg',
           'Avocado and Seaweed' => 'http://1.bp.blogspot.com/-DeW1rDMgI1k/UG-aRX_lozI/AAAAAAAACfw/M--XhwbRw_8/s400/bowl.jpg',
           'Kevin Bacon' => 'http://laughingsquid.com/wp-content/uploads/Kevin-Bacon.jpg',
           'Octopus and Beans' => 'http://kelseats.com/wp-content/uploads/2011/04/Bruschetta-with-Calamari-and-Tomato-Nopa.jpg',
           'Bacon Beignets' => 'http://3.bp.blogspot.com/_3h4FWGsx1DE/TEtktnTXWRI/AAAAAAAAB2I/7aa0D9lsOus/s400/bacon+beignets.jpg',
           'Beignets Quartet' => 'http://imonlyhereforthefood.com/images/Food/BrendasFrenchSoulFood/BrendasFrenchSoulFood002.jpg',
           'Plow Stack' => 'http://s3-media4.ak.yelpcdn.com/bphoto/EA0sTm3UqyMtayQLk08hOQ/l.jpg',
           'Cheese and More' => 'http://www.esquire.com/cm/esquire/images/eZ/nopalito-mexican-food-1109-lg.jpg',
           'Omelette' => 'http://www.tablehopper.com/newsletter/070417/foreign_cinema_large.jpg',
           'Adorable' => 'http://wineormous.com/wp-content/uploads/2012/12/WINEormous-at-The-French-Laundry-in-Yountville-CA.jpg'}

recipe.each { |title, image| Recipe.create(title: title, image_url: image) }

10.times do
  FactoryGirl.create(:user)
  FactoryGirl.create(:product)
end
