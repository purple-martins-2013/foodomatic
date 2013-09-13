FactoryGirl.create(:user, email: 'email@factory.com')
unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Mustard Seed Ramen', image_url: 'http://i.imgur.com/Su2lQ3B.jpg')
prod = Product.create(name: "mustard seeds", amount_type: unit.sample, price: "1.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "vegetable broth", amount_type: unit.sample, price: "2.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "noodles", amount_type: unit.sample, price: "2.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "green onions", amount_type: unit.sample, price: "1.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Vegatarian Meatballs', image_url: 'http://blog.hostthetoast.com/wp-content/uploads/2013/09/8-30-13-070.jpg')
prod = Product.create(name: "chickpea flour", amount_type: unit.sample, price: "1.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "toasted walnuts", amount_type: unit.sample, price: "2.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "olive oil", amount_type: unit.sample, price: "2.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "garlic", amount_type: unit.sample, price: "1.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Smore Hot Chocolate for You', image_url: 'http://31.media.tumblr.com/27fc9328b1b7d915ffdc30d67f789420/tumblr_mezlo6kYnZ1rslfxoo1_500.jpg')
prod = Product.create(name: "mini marshmallows", amount_type: unit.sample, price: "1.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "hot cocoa mix", amount_type: unit.sample, price: "2.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "chocolate syrup", amount_type: unit.sample, price: "2.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Unagi Rolls', image_url: 'http://farm3.staticflickr.com/2849/9729531511_cd23815119_b.jpg')
prod = Product.create(name: "rice", amount_type: unit.sample, price: "1.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "nori", amount_type: unit.sample, price: "3.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "avocado", amount_type: unit.sample, price: "7.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "freshwater eel", amount_type: unit.sample, price: "10.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Chili Kale Burger', image_url: 'http://i.imgur.com/DZuH6FH.jpg')
prod = Product.create(name: "brioche buns", amount_type: unit.sample, price: "1.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "ground chuck", amount_type: unit.sample, price: "3.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "beef chili", amount_type: unit.sample, price: "7.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "Russian red kale", amount_type: unit.sample, price: "10.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Weird Mystery Stew', image_url: 'http://farm6.staticflickr.com/5496/9730454498_8fba7dbb2f_h.jpg')
prod = Product.create(name: "blood sausage", amount_type: unit.sample, price: "4.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "green onions", amount_type: unit.sample, price: "1.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "sesame seeds", amount_type: unit.sample, price: "2.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "chicken broth", amount_type: unit.sample, price: "3.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Pork Belly Tacos', image_url: 'http://i.imgur.com/IWUnZR6.jpg')
prod = Product.create(name: "pork belly", amount_type: unit.sample, price: "4.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "cilantro", amount_type: unit.sample, price: "1.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "limes", amount_type: unit.sample, price: "1.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "tortillas", amount_type: unit.sample, price: "2.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: "Martino's Mozzarella Bites", image_url: 'http://i.imgur.com/8nuolGP.jpg#.UVIfdXvd27k.reddit')
prod = Product.create(name: "frozen cheese raviolis", amount_type: unit.sample, price: "4.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "parmesan cheese", amount_type: unit.sample, price: "4.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "marinara sauce", amount_type: unit.sample, price: "2.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "parseley", amount_type: unit.sample, price: "1.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

unit = [ "grams", "kilograms", "liter", "milliliter", "pinch", "teaspoon"]
num = [1,2,3,4,5,2]

recipe = Recipe.create(title: 'Jupitorte', image_url: 'http://bakecrumbs.files.wordpress.com/2013/07/ccjupitercake08.jpg')
prod = Product.create(name: "flour", amount_type: unit.sample, price: "4.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "cocoa powder", amount_type: unit.sample, price: "4.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "icing", amount_type: unit.sample, price: "2.50", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)
prod = Product.create(name: "beet root powder", amount_type: unit.sample, price: "1.00", min_amount: 1)
prod.ingredients.create(required_amount: num.sample, recipe: recipe)

recipe = Recipe.create(title: "Martino's Mozzarella Bites", image_url: 'http://i.imgur.com/8nuolGP.jpg#.UVIfdXvd27k.reddit')
recipe = Recipe.create(title: 'Lobster a la Awesome', image_url: 'http://i.imgur.com/CZLh2tI.jpg')
recipe = Recipe.create(title: 'Fire Fire Burger', image_url: 'http://i.imgur.com/avBDsUn.jpg')
recipe = Recipe.create(title: 'Falafel', image_url: 'http://i.imgur.com/gP3nb6n.jpg')
recipe = Recipe.create(title: 'Prawns atop Sausage', image_url: 'http://i.imgur.com/F6S1p.jpg')
recipe = Recipe.create(title: 'Guac Melt', image_url: 'http://i.imgur.com/C45KqGY.jpg')
recipe = Recipe.create(title: 'Italian Brunch Pizza', image_url: 'http://i.imgur.com/6moxCeT.jpg')
recipe = Recipe.create(title: 'Steak Sandwich', image_url: 'http://i.imgur.com/J9DLQ.jpg')
recipe = Recipe.create(title: 'Tomato, Chive, Parmesan Flatbread', image_url: 'http://i.imgur.com/EZh81wU.jpg')
recipe = Recipe.create(title: 'Jalepeno Poppers', image_url: 'http://i.imgur.com/CeeHIIm.jpg')
recipe = Recipe.create(title: 'Sushi Spread', image_url: 'http://i.imgur.com/Yrp9nZu.jpg')
recipe = Recipe.create(title: 'Valentine Custard', image_url: 'http://i.imgur.com/5dONz.jpg')
recipe = Recipe.create(title: 'Earl Grey Frozen Yogurt', image_url: 'http://i.imgur.com/0YYEZqp.jpg')
recipe = Recipe.create(title: 'Barbacoa Tacos', image_url: 'http://i.imgur.com/6LOAp.jpg')
recipe = Recipe.create(title: 'Molten Chocolate Cake', image_url: 'http://blog.hostthetoast.com/wp-content/uploads/2013/01/Can-Cakes-0443.jpg')
recipe = Recipe.create(title: 'Avocado Bagels', image_url: 'http://i.imgur.com/e6I642S.jpg')
recipe = Recipe.create(title: 'Habanero Thyme Chicken', image_url: 'http://i.imgur.com/zE0WXFG.jpg')
recipe = Recipe.create(title: 'Velvet Whoopie Pie', image_url: 'http://i.imgur.com/ZTGqigb.jpg')
recipe = Recipe.create(title: 'Caramel Coconut Donuts', image_url: 'http://i.imgur.com/gU2Bdn2.jpg')
recipe = Recipe.create(title: 'Turkey Sandwich', image_url: 'http://i.imgur.com/D0zIAxC.jpg')
recipe = Recipe.create(title: 'Green Onion Scones', image_url: 'http://i.imgur.com/HNKuBK5.jpg')
recipe = Recipe.create(title: 'BBQ Chicken atop Remoulade', image_url: 'http://i.imgur.com/RiY8Llk.jpg')
recipe = Recipe.create(title: 'Pork Brisket', image_url: 'http://i.imgur.com/TQ9P03b.jpg')
recipe = Recipe.create(title: 'Avocado Tomato Melt', image_url: 'http://i.imgur.com/aG03T.jpg')
recipe = Recipe.create(title: 'Heart Shaped T-bone', image_url: 'http://i.imgur.com/i3kUJ.jpg')
recipe = Recipe.create(title: 'Mozzarella Stuffed Gouda Pastry', image_url: 'http://i.imgur.com/fWzSE.jpg')
recipe = Recipe.create(title: "Shephard's Loaf", image_url: 'http://i.imgur.com/p4HnQd8.jpg')
recipe = Recipe.create(title: 'Kabab!', image_url: 'http://i.imgur.com/MQWF6Re.jpg')
recipe = Recipe.create(title: 'Burger Time', image_url: 'http://farm8.staticflickr.com/7319/9716454028_5c1ebfc08d_k.jpg')
recipe = Recipe.create(title: 'Salami, Fig Flatbread', image_url: 'http://i.imgur.com/RhtK0ZY.jpg')
recipe = Recipe.create(title: 'Butternut Squash Boats', image_url: 'http://thevegetarianginger.files.wordpress.com/2013/03/dsc1251.jpg')
recipe = Recipe.create(title: "Presto it's Pesto Ravioli", image_url: 'http://i.imgur.com/AKMPeEC.jpg')
recipe = Recipe.create(title: 'Strawberry Cheesecake', image_url: 'http://i.imgur.com/7ekD0Kq.jpg')
recipe = Recipe.create(title: 'Bacon Meet Bun', image_url: 'http://i.imgur.com/oPLXjDn.jpg')

