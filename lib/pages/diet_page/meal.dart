class Meal {
  final String mealTime, name, imagePath, kiloCaloriesBurnt, timeTaken;
  final String preparation;
  final List ingredients;

  Meal(
      {required this.mealTime,
      required this.name,
      required this.imagePath,
      required this.kiloCaloriesBurnt,
      required this.timeTaken,
      required this.preparation,
      required this.ingredients});
}

final List<Meal> kcal2000_MENU1 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Vegetarian Omelette ",
      kiloCaloriesBurnt: "464",
      timeTaken: "10",
      imagePath: "assets/VEGETARIAN-OMELETTE.jpeg",
      ingredients: [
        "  2 large eggs",
        "¼ red pepper, chopped",
        "¼ cup Cheddar cheese, grated",
        "a few leaves of fresh baby spinach",
        "2 cherry tomatoes, chopped",
        "salt and pepper",
        "¼ teaspoon butter",
      ],
      preparation: '''Cut the cherry tomatoes, red pepper and spinach leaves.
Melt the butter in the frying pan.
Beat the eggs with a fork and season with salt and pepper.
Add the mixture to the pan and spread it out evenly. When it starts to firm up, but still has a bit of raw on top, add grated cheese and also the cherry tomatoes, spinach, and red pepper.
Using a spatula, ease the edges and quickly turn it over onto the other side.
The other side will cook a lot quicker, it only needs about 1-2 minutes.
When it is done, place a large plate on top of the pan and flip the omelette as fast as you can.
Serve immediately.'''),
  Meal(
      mealTime: "Lunch",
      name: "Mediterranean tuna pita pockets",
      kiloCaloriesBurnt: "680",
      timeTaken: "15",
      imagePath: "assets/Mediterranean-tuna-pita-pockets.jpeg",
      ingredients: [
        "4 teaspoons roasted red pepper olive oil",
        "4 teaspoons balsamic vinegar",
        "8 slices whole grain bread or 8 slices pita bread",
        "2 (6 ounce) cans tuna in water, drained and flaked",
        "1/3 cup sun-dried tomato packed in oil, drained",
        "1/4 cup ripe green olives or 1/4 cup ripe olives, sliced",
        "1/4 cup red onions or 1/4 cup sweet Spanish onion, finely chopped",
        "1/4 cup red bell pepper, finely chopped (optional)",
        "3 tablespoons mayonnaise (optional) or 3 tablespoons low-fat mayonnaise (optional)",
        "2 teaspoons capers (more to taste)",
        "1/4 teaspoon fresh ground black pepper",
        "4 romaine lettuce leaves or 4 curly green lettuce leaves",
      ],
      preparation: '''Toast bread if desired.
Combine olive oil and vinegar in a small bowl; brush oil mixture evenly over 1 side of each bread slice or inside pita pockets.
Combine tuna and the rest of the ingredients (except lettuce).
Place 1 lettuce leaf on each of 4 bread slices.
Top the lettuce evenly with tuna mixture, and cover with remaining bread slices.
Serve immediately.
          '''),
  Meal(
      mealTime: "DINNER",
      name: "Salmon with veggies and wild rice",
      kiloCaloriesBurnt: "810",
      timeTaken: "30",
      imagePath: "assets/salmon-with-veggies-and-wild-rice.jpeg",
      ingredients: [
        "5 skinless salmon fillets, fresh or frozen (1 1/4 lbs.)"
            "2 tablespoons balsamic vinegar",
        "1 tablespoon honey",
        "¼ teaspoon salt",
        "⅛ teaspoon ground pepper",
        "1 cup chopped red and/or yellow bell pepper",
        "½ to 1 small jalapeño pepper, seeded and finely chopped",
        "2 scallions (green parts only), thinly sliced",
        "¼ cup chopped fresh Italian parsley",
        "2 2/3 cups Wild Rice Pilaf (see Associated Recipes)",
      ],
      preparation:
          '''Thaw salmon, if frozen. Preheat oven to 425 degrees F. Line a 15-by-10-inch baking pan with parchment paper. Place the salmon in the prepared pan. Whisk vinegar and honey in a small bowl; drizzle half of the mixture over the salmon. Sprinkle with salt and pepper.

Roast the salmon until the thickest part flakes easily, about 15 minutes. Drizzle with the remaining vinegar mixture.

Coat a 10-inch nonstick skillet with cooking spray; heat over medium heat. Add bell pepper and jalapeño; cook, stirring frequently, just until tender, 3 to 5 minutes. Remove from heat. Stir in scallion greens.

Top 4 of the salmon fillets with the pepper mixture and parsley. Serve with pilaf. (Refrigerate the remaining salmon for another use, see Note.)'''),
];

final List<Meal> kcal2000_MENU2 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "nut butter and banana toast ",
      kiloCaloriesBurnt: "507",
      timeTaken: "5",
      imagePath: "assets/nut-butter-and-banana-toast.jpeg",
      ingredients: [
        " 2 slices granary bread",
        "1 small banana",
        "½ tsp cinnamon",
        "1 tbsp crunchy peanut butter",
      ],
      preparation:
          '''Toast bread and slice banana. Layer banana on one slice of toast and dust with cinnamon. Spread the second slice with peanut butter, then sandwich the two together and eat straight away.'''),
  Meal(
      mealTime: "Lunch",
      name: "avocado-tuna salad",
      kiloCaloriesBurnt: "717",
      timeTaken: "10",
      imagePath: "assets/Avocado-Tuna-Salad.jpg",
      ingredients: [
        "1 5-ounce can tuna, preferably packed in olive oil, drained",
        "1/2 ripe avocado, roughly chopped",
        "1/2 cup minced celery",
        "1/4 cup minced red onion",
        "1 tablespoon extra virgin olive oil",
        "2 teaspoons lemon juice",
        "1 teaspoon lemon zest",
        "2 tablespoons chopped fresh cilantro or parsley",
        "1/2 teaspoon kosher salt",
        "Freshly ground black pepper",
      ],
      preparation:
          '''Place all of the ingredients in a medium bowl. Mix with a fork, mashing the avocado and breaking up the chunks of tuna as you go, until the ingredients are well combined.
          Add more oil or salt and pepper if necessary, serve on your favorite sandwich bread or toast.
          '''),
  Meal(
      mealTime: "DINNER",
      name: "chicken and broccoli stir-fry",
      kiloCaloriesBurnt: "932",
      timeTaken: "35",
      imagePath: "assets/brokoliandchicken.jpeg",
      ingredients: [
        "5 skinless salmon fillets, fresh or frozen (1 1/4 lbs.)",
        "⅔ cup soy sauce",
        "¼ cup brown sugar",
        "½ teaspoon ground ginger",
        "1 pinch red pepper flakes, or to taste",
        "2 tablespoons water",
        "2 tablespoons cornstarch",
        "2 teaspoons vegetable oil, or to taste",
        "3 skinless, boneless chicken breast halves, cut into chunks",
        "1 onion, sliced",
        "3 cups broccoli florets",
      ],
      preparation: '''Gather all ingredients.
          Stir soy sauce, brown sugar, ginger, and red pepper flakes together in a bowl until sugar dissolves. Mix water and cornstarch together in a small bowl; stir with a whisk until cornstarch dissolves completely.
          Heat oil in a large skillet over high heat. Fry chicken and onion in hot oil until chicken is no longer pink in the center and onion is tender, 5 to 7 minutes.
Stir in broccoli with chicken and onion; sauté until broccoli is hot, about 5 minutes.
Push chicken and vegetable mixture to the side of the skillet. Pour soy sauce mixture into the vacant part of the skillet. Stir cornstarch slurry into soy sauce mixture until the color is consistent.
Move chicken and vegetables back into the center of the pan; sauté until sauce thickens and coats chicken and vegetables, about 5 minutes more.
'''),
];

final List<Meal> kcal2000_MENU3 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "berry yogurt parfait ",
      kiloCaloriesBurnt: "404",
      timeTaken: "10",
      imagePath: "assets/yogurtParfait.jpeg",
      ingredients: [
        " ¾ cup sliced strawberries",
        "¾ cup blueberries",
        "1 (6 ounce) container vanilla yogurt",
        "1 tablespoon wheat germ",
        "½ banana, sliced",
        "⅓ cup granola",
      ],
      preparation:
          '''Layer 1/4 cup strawberries, 1/4 cup blueberries, 1/3 container yogurt, 1/3 tablespoon wheat germ, 1/3 of the sliced banana, and about 2 tablespoons of granola in a large bowl. Continue to build the parfait, repeating the layers until all of the ingredients are used completely.

'''),
  Meal(
      mealTime: "Lunch",
      name: "peanut noodles with tofu and peas",
      kiloCaloriesBurnt: "1075",
      timeTaken: "25",
      imagePath: "assets/TofuPeanutNoodless.jpeg",
      ingredients: [
        " For pasta:",
        "",
        "8 ounces soba or udon noodles ",
        "6 scallions, including a few inches of green, sliced on the diagonal ",
        "4 tablespoons chopped fresh cilantro ",
        "1 cup thinly sliced pea pods ",
        "1 cup mung bean sprouts",
        "",
        "For preparing peanut sauce:",
        "",
        "¼ cup natural peanut butter or reduced fat smooth or chunky versions ",
        "1 garlic clove, minced ",
        "1 ½ tablespoons reduced sodium soy sauce",
        "1 tablespoon balsamic vinegar ",
        "2 teaspoons sugar ",
        "pinch of cayenne pepper, to taste ",
        "¼ cup hot water",
        "",
        "For preparing tofu:",
        "",
        "1 carton extra firm tofu ",
        "2 garlic cloves, thinly sliced ",
        "2 Tablespoons fresh lemon juice ",
        "4 Tablespoons reduced sodium soy sauce ",
        "1 Tablespoon molasses ",
        "2 teaspoons dark sesame oil ",
        "3 Tablespoons chopped fresh cilantro ",
        "Freshly ground black pepper, to taste",
      ],
      preparation:
          '''Bring 4 quarts of water to a boil for the noodles. While the water is heating, prepare the tofu, peanut sauce and garnishes.
       Thinly slice pea pods with a sharp knife; dice scallions on a diagonal and finely chop the fresh cilantro. Set aside.
       Combine all peanut sauce ingredients in a food processor, except for the water, and puree until smooth. Gradually pour in the water. Taste and add more cayenne if needed.
Drain the tofu with a paper towel; cut into 1-inch cubes and blot again with paper towel.
While tofu is draining, combine the next 6 ingredients in a small bowl. Season with pepper. Heat a large nonstick pan and spray lightly with cooking spray.
When the pan is hot, add tofu and cook over medium-high heat (without turning) until slightly golden and crisp, about 7 minutes. Turn and cook on the other side.
Pour in the marinade, bean sprouts and pea pods and coat entirely. Cook over medium heat until the tofu is glazed, pea pods are slightly crunchy, and the sauce is of a syrup consistency. Don’t let it cook so long it gets sticky.
          
          '''),
  Meal(
      mealTime: "DINNER",
      name: "fish tacos",
      kiloCaloriesBurnt: "644",
      timeTaken: "40",
      imagePath: "assets/fish-tacos.jpeg",
      ingredients: [
        " 3 tbsp. extra-virgin olive oil",
        "Juice of 1 lime",
        "2 tsp. chili powder",
        "1 tsp. paprika ",
        "1/2 tsp. ground cumin",
        "1/2 tsp. cayenne pepper",
        "1 1/2 lb. cod (or other flaky white fish)",
        "1/2 tbsp. vegetable oil",
        "Kosher salt",
        "Freshly ground black pepper",
        "8 corn tortillas",
        "1 avocado, diced",
        "Lime wedges, for serving",
        "Sour cream, for serving",
        "",
        "FOR THE CORN SLAW:",
        "",
        "1/4 c. mayonnaise",
        "Juice of 1 lime",
        "2 tbsp. freshly chopped cilantro",
        "1 tbsp. honey",
        "2 c. shredded purple cabbage",
        "1 c. corn kernels",
        "1 jalapeño, minced",
      ],
      preparation:
          '''In a medium shallow bowl, whisk together olive oil, lime juice, paprika, chili powder, cumin, and cayenne.

Add cod, tossing until evenly coated. Let marinate 15 minutes.

Meanwhile, make slaw: In a large bowl, whisk together mayonnaise, lime juice, cilantro, and honey. Stir in cabbage, corn, and jalapeño. Season with salt and pepper.

In a large nonstick skillet over medium-high heat, heat vegetable oil. Remove cod from marinade and season both sides of each filet with salt and pepper. Add fish flesh side-down. Cook until opaque and cooked through, 3 to 5 minutes per side. Let rest 5 minutes before flaking with a fork.

Assemble tacos: Serve fish over grilled tortillas with corn slaw and avocado. Squeeze lime juice on top and garnish with sour cream.
'''),
];
final kcal2500_MENU1 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Vegetable Sandwich  ",
      kiloCaloriesBurnt: "768",
      timeTaken: "15",
      imagePath: "assets/Veg. Sandwich .jpeg",
      ingredients: [
        "8 slices white bread or whole wheat, brown bread or any soft bread",
"1.6 potatoes small to medium-sized, boiled and sliced into rounds",
"0.8 beetroot  medium sized, boiled and thinly sliced",
"0.8 cucumber thinly sliced",
"0.8 small to medium onion  thinly sliced",
"0.8 medium tomato  thinly sliced",
"Butter softened and at room temperature, salted or unsalted, as required",
"chaat masala as required",
"black salt as required",
"roasted cumin powder as requiredoptional",
"freshly ground black pepper optional",
"tomato ketchup or sauce to be served with the sandwiches",
"",
"For Making Coriander Chutney",
"",
"0.8 cup tightly packed coriander leaves (cilantro) Or ½ cup coriander leaves and ½ cup mint leaves",
"0.4 to 0.8 teaspoon chaat masala powder or add as required",
"0.8 to 1.6 green chilies you can also add 2 to 3 green chilies",
"salt or black salt as per taste",
"0.8 to 1.6 teaspoons water for blending or grinding, optional",
      ],
      preparation:
          '''In a mixie or blender, take coriander leaves, chaat masala powder and green chilies.
Just add a pinch or two of salt as chaat masala already has salt in it.
Grind the chutney ingredients till smooth. No need to add water. But if you cannot grind, then add 1 or 2 teaspoons of water.
Collect the coriander chutney in a bowl. 
Check the taste and add more salt if required. 
Cover and keep the chutney aside if you are making veg sandwiches immediately or else refrigerate.
Preparing Vegetables
Boil or steam the beetroot and potatoes till they are tender. You can steam both the veggies in a pan, stove-top pressure cooker or in the instant pot.
When cooled, peel both the vegetables. Then thinly slice the beetroot and slice the potatoes as well.
Peel and thinly slice onion and cucumber. 
Thinly slice the tomatoes as well. Peel and rinse the onions. Thinly slice the onions.
Making Veg Sandwich
Trim the edges of the bread slices if you want.
Butter the bread slices evenly and very well.
Now apply the coriander chutney to the slices.
Place all the veggie slices one by one.
Sprinkle the black salt and chaat masala on each one of them or alternately.
Cover the sandwich with the bread slices with the butter and chutney on them.
Slice into triangles or rectangles.
Serve Bombay veg sandwich immediately with tomato ketchup and the coriander chutney. Do not let them rest as they become soggy.'''),
  Meal(
      mealTime: "Lunch",
      name: "DAL CHAWAL",
      kiloCaloriesBurnt: "878",
      timeTaken: "75",
      imagePath: "assets/DAL CHAWAL.jpeg",
      ingredients: [
   "    1 cup Mix daal 1/4 cup each split chickpeas (Chana Dal), split pigeon peas (Toor Dal), petite yellow lentils (Moong Dal), and red lentils (Masoor dal), see notes",
"4 tbsp Oil",
"5-7 Curry leaves see notes",
"½ tsp Mustard seeds see notes",
"¼ tsp Fenugreek seeds see notes",
"2-3 Whole red chili see notes",
"1 tbsp Ginger/garlic paste",
"1 Onion, chopped or 3-4 tbsp fried onion",
"1 tsp Cumin powder",
"1 tsp Coriander powder",
"1 tsp Red chilli powder to taste",
"½ tsp Turmeric powder",
"1 tsp Salt to taste",
"2 medium tomatoes, chopped or 4 tbsp Crushed Tomato",
"2 tbsp cilantro, chopped optional, for garnish",
"1-2 green chilis, chopped optional, for garnish",
"",
"Rice",
"",
"1 cup basmati rice soaked",
"1 tsp salt adjust to taste",
      ],
      preparation:
          '''Soak the mixed daal for at least 20 minutes
In a large pot, with 2-3 cups of water, boil it till tender.
Blend the daal with the water using a blender or an immersion blender, until it is smooth, or leave a little chunky as desired.
In a separate pot, on low heat, add oil and curry leaves, mustard seeds, fenugreek, and whole red chilli, if using (see notes) until fragrant and mustard seeds start cracking.
Add chopped onions and cook till golden. If using fried onions, cook for 2-3 minutes.
Add ginger/garlic paste and cook for few minutes make sure it does not burn. Add couple of tbsp water at this point. If the pan is too hot your spices might burn.
Add all the powder spices and cook for few minutes, making sure it does not stick. Add a little water if needed.
Add tomatoes, mix well and let it cook for 2-3 minutes.
Add the blended dal and mix together.
Simmer on low heat, for 15 minutes to allow the flavors to blend together. Add water if desired to make daal with a thinner consistency.
Top with chopped cilantro and/or chopped green chili
Rice
Wash, then soak 1 cup basmati rice for 20 minutes.
In a medium pot, on high heat, let 4 cups of water come to a boil with the salt.
Drain, then add the soaked basmati rice to the boiling water. Turn heat down to medium.
Let rice cook uncovered for 10-15 minutes, or until tender
Strain rice in a colander or sieve.
          '''),
  Meal(
      mealTime: "DINNER",
      name: "Chicken stew",
      kiloCaloriesBurnt: "1152",
      timeTaken: "45",
      imagePath: "assets/Chicken-stew.jpeg",
      ingredients: [
       " 2 tbsp. butter",
"2 large carrots, peeled and sliced into coins",
"1 stalk celery, chopped",
"Kosher salt",
"Freshly ground black pepper",
"3 cloves garlic, minced",
"1 tbsp. all-purpose flour",
"1 1/2 lb. boneless skinless chicken breasts",
"3 sprigs fresh thyme",
"1 bay leaf",
"3/4 lb. baby potatoes, quartered",
"3 c. low-sodium chicken broth ",
"Freshly chopped parsley, for garnish",
      ],
      preparation: '''GIn a large pot over medium heat, melt butter. Add carrots and celery and season with salt and pepper. Cook, stirring often, until vegetables are tender, about 5 minutes. Add garlic and cook until fragrant, about 30 seconds.

Add flour and stir until vegetables are coated, then add chicken, thyme, bay leaf, potatoes, and broth. Season with salt and pepper. Bring mixture to a simmer and cook until the chicken is no longer pink and potatoes are tender, 15 minutes.

Remove from heat and transfer chicken to a medium bowl. Using two forks, shred chicken into small pieces and return to pot. 

Garnish with parsley before serving.
'''),
];

final meals = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Fruit Granola",
      kiloCaloriesBurnt: "271",
      timeTaken: "10",
      imagePath: "assets/fruit_granola.jpg",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisins",
        "1 tbsp of honey",
      ],
      preparation:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.

Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.

Consectetur adipiscing elit duis tristique sollicitudin nibh. Dictumst quisque sagittis purus sit amet volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Mauris pharetra et ultrices neque. Leo duis ut diam quam nulla porttitor. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Blandit massa enim nec dui. Aliquam id diam maecenas ultricies mi eget mauris. Mattis rhoncus urna neque viverra justo nec ultrices. Nibh tellus molestie nunc non blandit. Non diam phasellus vestibulum lorem. Ut diam quam nulla porttitor massa id neque aliquam. Eget mauris pharetra et ultrices neque ornare aenean euismod. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Tellus in hac habitasse platea dictumst vestibulum.

Adipiscing commodo elit at imperdiet. Mollis nunc sed id semper risus. Magna fermentum iaculis eu non. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Massa tempor nec feugiat nisl pretium. Etiam dignissim diam quis enim lobortis scelerisque. Duis ut diam quam nulla.

Ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Vitae aliquet nec ullamcorper sit amet risus. Malesuada nunc vel risus commodo viverra. Id aliquet risus feugiat in ante metus dictum at tempor. Commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Ipsum dolor sit amet consectetur. In nibh mauris cursus mattis molestie a. Duis at consectetur lorem donec massa sapien faucibus et molestie. Amet nisl purus in mollis nunc sed id. Sagittis vitae et leo duis ut. Purus in mollis nunc sed id. Mauris ultrices eros in cursus turpis.'''),
  Meal(
      mealTime: "LUNCH",
      name: "Keto Snack",
      kiloCaloriesBurnt: "413",
      timeTaken: "16",
      imagePath: "assets/keto_snack.jpg",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisins",
        "1 tbsp of honey",
      ],
      preparation:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.

Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.

Consectetur adipiscing elit duis tristique sollicitudin nibh. Dictumst quisque sagittis purus sit amet volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Mauris pharetra et ultrices neque. Leo duis ut diam quam nulla porttitor. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Blandit massa enim nec dui. Aliquam id diam maecenas ultricies mi eget mauris. Mattis rhoncus urna neque viverra justo nec ultrices. Nibh tellus molestie nunc non blandit. Non diam phasellus vestibulum lorem. Ut diam quam nulla porttitor massa id neque aliquam. Eget mauris pharetra et ultrices neque ornare aenean euismod. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Tellus in hac habitasse platea dictumst vestibulum.

Adipiscing commodo elit at imperdiet. Mollis nunc sed id semper risus. Magna fermentum iaculis eu non. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Massa tempor nec feugiat nisl pretium. Etiam dignissim diam quis enim lobortis scelerisque. Duis ut diam quam nulla.

Ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Vitae aliquet nec ullamcorper sit amet risus. Malesuada nunc vel risus commodo viverra. Id aliquet risus feugiat in ante metus dictum at tempor. Commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Ipsum dolor sit amet consectetur. In nibh mauris cursus mattis molestie a. Duis at consectetur lorem donec massa sapien faucibus et molestie. Amet nisl purus in mollis nunc sed id. Sagittis vitae et leo duis ut. Purus in mollis nunc sed id. Mauris ultrices eros in cursus turpis.'''),
  Meal(
      mealTime: "DINNER",
      name: "Pesto Pasta",
      kiloCaloriesBurnt: "612",
      timeTaken: "15",
      imagePath: "assets/pesto_pasta.jpg",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisins",
        "1 tbsp of honey",
      ],
      preparation:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.

Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.

Consectetur adipiscing elit duis tristique sollicitudin nibh. Dictumst quisque sagittis purus sit amet volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Mauris pharetra et ultrices neque. Leo duis ut diam quam nulla porttitor. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Blandit massa enim nec dui. Aliquam id diam maecenas ultricies mi eget mauris. Mattis rhoncus urna neque viverra justo nec ultrices. Nibh tellus molestie nunc non blandit. Non diam phasellus vestibulum lorem. Ut diam quam nulla porttitor massa id neque aliquam. Eget mauris pharetra et ultrices neque ornare aenean euismod. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Tellus in hac habitasse platea dictumst vestibulum.

Adipiscing commodo elit at imperdiet. Mollis nunc sed id semper risus. Magna fermentum iaculis eu non. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Massa tempor nec feugiat nisl pretium. Etiam dignissim diam quis enim lobortis scelerisque. Duis ut diam quam nulla.

Ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Vitae aliquet nec ullamcorper sit amet risus. Malesuada nunc vel risus commodo viverra. Id aliquet risus feugiat in ante metus dictum at tempor. Commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Ipsum dolor sit amet consectetur. In nibh mauris cursus mattis molestie a. Duis at consectetur lorem donec massa sapien faucibus et molestie. Amet nisl purus in mollis nunc sed id. Sagittis vitae et leo duis ut. Purus in mollis nunc sed id. Mauris ultrices eros in cursus turpis.'''),
];
