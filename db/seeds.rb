# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t1 = Tag.create(name: 'Quick')
t2 = Tag.create(name: 'Beginner')
t3 = Tag.create(name: 'Advanced')
t4 = Tag.create(name: 'Fun')
t5 = Tag.create(name: 'Limited Ingredients')
t6 = Tag.create(name: 'Vegan')
t7 = Tag.create(name: 'Gluten Free')
t8 = Tag.create(name: 'Tons of Gluten')
t9 = Tag.create(name: 'Vegitarian')
t10 = Tag.create(name: 'Keto')
t11 = Tag.create(name: 'Air Fryer')
all_tags = [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11]
# one
# r1 = Recipe.create(
#     name: 'Best Pizza Dough Ever',
#     slug: 'bpa_1',
#     description: 'This is the best homemade pizza dough you will ever have!',
#     instructions: %q(
#         1. Mix in a large bowl 3 cups of bread flour, 7tsp of sugar,
#             and 1.5 tsb of yeast
#           <br />
#         2. Slowly mix in 10.3oz of cold water
#             <br />
#         3. Kneed by hand until everything is mixed and the dough is solid.<br/>
#         4. Form into a ball by hand, and refriderate for 24hrs, letting the
#             dough ferment.
#     ),
#     prep_time: 60,
#     cook_time: 12
# )
# r1.tags << [t1, t2, t4, t8]
#
# r2 = Recipe.create(
#     name: 'Swedish Meatballs',
#     slug: 'smb_293',
#     description: 'These swedish meatballs will knock your kilt off.',
#     instructions: 'Shove a bunch of meat into a ball',
#     prep_time: 15,
#     cook_time: 45
# )
# r2.tags << [t1, t10, t7, t5, t4]
#
#
# r3 = Recipe.create(
#     name: 'Air Fryer Potatoes',
#     slug: 'smb_293',
#     description: 'Cube up potatoes, throw them in ',
#     instructions: %q(
#         1. Toss your diced potatoes in a large bowl with olive oil.
# Season with salt, pepper, chili powder, and dried parsley.
# Use your hands or a spoon to move the potatoes around so each piece is evenly coated.
#  Place them in the air fryer at 400 degrees for 20 to 25 minutes. <br />
#
#    2.  If your air fryer has a basket you’ll want to stop cooking after 10 minutes and
# shake the potatoes. This keeps the potatoes at the bottom from becoming underdone.
# Place the basket back in the air fryer and cook for another 10 to 15 minutes.<br/>
#
#     3. Potatoes should be crispy and fully cooked. (Total air fryer cooking time
# is 20 to 25 minutes. 25 minutes is the right number for my air fryer but each fryer
# can vary.)
#     ),
#     prep_time: 15,
#     cook_time: 45
# )
# r3.tags << [t1, t2, t6, t11, t10, t5]

150.times do
  recipe = Recipe.create(
      name: Faker::Food.dish,
      slug: Faker::Food.dish.downcase,
      description: Faker::Food.description,
      instructions: '',
      prep_time: Faker::Number.between(from: 1, to: 350),
      cook_time: Faker::Number.between(from: 1, to: 350),
      tags: all_tags.sample(rand(1..9))
  )
end