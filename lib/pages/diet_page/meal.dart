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

final underweight_MENU1 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Green Chutney",
      kiloCaloriesBurnt: "232",
      timeTaken: "20",
      imagePath: "assets/greenchutney.jpeg",
      ingredients: [
        "  1 cup coriander leaves",
        "½ cup mint leaves / pudina",
        "3 clove garlic",
        "3 inch ginger",
        "2 tbsp roasted gram dal / putani",
        "3 green chilli",
        "½ tsp cumin powder / jeera powder",
        "1 tsp chaat masala",
        "½ tsp sugar",
        "½ tsp salt",
        "pinch of hing / asafoetida",
        "½ cup water",
        "1 tbsp lemon juice",
      ],
      preparation:
          '''firstly, in a blender take 1 cup coriander leaves and ½ cup mint leaves.

also add 3 clove garlic, 3 inch ginger and 3 green chilli.

additionally add 2 tbsp roasted gram dal, ½ tsp cumin powder, 1 tsp chaat masala, ½ tsp sugar, ½ tsp salt and pinch of hing.

blend smooth adding ½ cup water.

transfer to a cup and mix 1 tbsp lemon juice.

finally, green chutney for chaat is ready to use for sandwich or chaats..'''),
  Meal(
      mealTime: "Lunch",
      name: "Potato Curry",
      kiloCaloriesBurnt: "125",
      timeTaken: "30",
      imagePath: "assets/potatocurry.jpeg",
      ingredients: [
        "  2 tbsp vegetable or sunflower oil",
        "1 tbsp brown or black mustard seeds",
        "3 long dried red Indian chillies",
        "12-15 curry leaves",
        "2 onions, sliced",
        "2 tsp ground coriander",
        "2 tsp garam masala",
        "2 tsp turmeric",
        "500g tomatoes, quartered",
        "800g potatoes, peeled and cut into very large chunks",
        "400g can coconut milk",
        "chapatis, rotis or naan bread, to serve",
      ],
      preparation:
          '''Heat the oil in a large pan and fry the mustard seeds, chillies and curry leaves until the seeds start to pop. Add the onions and fry until softened and starting to brown. stir in the spices, add the tomatoes and fry for 5 mins. Add the potatoes and stir to coat. Pour in the coconut milk with 200ml water. Bring to the boil and simmer for 20-25 mins, stirring occasionally, until the potatoes are just tender.
          To make the raita, mix all the ingredients together with some seasoning.
          If the curry looks a little too saucy, scoop out the potatoes with a slotted spoon into another dish, then boil the sauce until reduced a little. stir the potatoes back in to heat through, and season well (this curry needs a good sprinkling of salt). serve with warmed Indian bread and a dollop of raita.
          '''),
  Meal(
      mealTime: "DINNER",
      name: "Chicken Curry",
      kiloCaloriesBurnt: "235",
      timeTaken: "15",
      imagePath: "assets/ChickenCurryCupofNoodles.jpeg",
      ingredients: [
        "1 teaspoons reduced-sodium chicken bouillon paste, divided",
        "2 teaspoons red curry paste, divided",
        "2 tablespoons coconut milk, divided",
        "1 ½ cups frozen stir-fry vegetable mix, divided",
        "3 ounces chopped cooked boneless, skinless chicken breast, divided",
        "1 ½ cups spiralized zucchini noodles, divided",
        "1 teaspoons chopped cilantro, divided",
        "1 cups very hot water, divided,",
      ],
      preparation:
          '''Add 1 teaspoon bouillon paste, 2 teaspoons curry paste and 2 tablespoons coconut milk to each of three 1 1/2-pint canning jars. Layer 1/2 cup vegetables, 3 ounces chicken and 1/2 cup noodles in each jar. Top each with 1 teaspoon cilantro. Cover and refrigerate for up to 3 days.

To prepare one jar of noodles: Add 1 cup very hot water to a jar. Cover and shake to combine. Uncover and microwave on High in 1-minute increments until steaming hot, 2 to 3 minutes total. Let stand 5 minutes. Stir before eating.'''),
];
final kcal2000_MENU1 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Vegetarian Omelette ",
      kiloCaloriesBurnt: "464",
      timeTaken: "10",
      imagePath: "assets/greenchutney.jpeg",
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
      imagePath: "assets/potatocurry.jpeg",
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
      imagePath: "assets/ChickenCurryCupofNoodles.jpeg",
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
final kcal2000_MENU2 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "nut butter and banana toast ",
      kiloCaloriesBurnt: "507",
      timeTaken: "5",
      imagePath: "assets/greenchutney.jpeg",
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
      imagePath: "assets/potatocurry.jpeg",
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
      kiloCaloriesBurnt: "810",
      timeTaken: "35",
      imagePath: "assets/ChickenCurryCupofNoodles.jpeg",
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
final kcal2000_MENU3 = [
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
      preparation: '''In a medium shallow bowl, whisk together olive oil, lime juice, paprika, chili powder, cumin, and cayenne.

Add cod, tossing until evenly coated. Let marinate 15 minutes.

Meanwhile, make slaw: In a large bowl, whisk together mayonnaise, lime juice, cilantro, and honey. Stir in cabbage, corn, and jalapeño. Season with salt and pepper.

In a large nonstick skillet over medium-high heat, heat vegetable oil. Remove cod from marinade and season both sides of each filet with salt and pepper. Add fish flesh side-down. Cook until opaque and cooked through, 3 to 5 minutes per side. Let rest 5 minutes before flaking with a fork.

Assemble tacos: Serve fish over grilled tortillas with corn slaw and avocado. Squeeze lime juice on top and garnish with sour cream.
'''),
];
final kcal2500_MENU1 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "nut butter and banana toast ",
      kiloCaloriesBurnt: "507",
      timeTaken: "5",
      imagePath: "assets/greenchutney.jpeg",
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
      imagePath: "assets/potatocurry.jpeg",
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
      kiloCaloriesBurnt: "810",
      timeTaken: "35",
      imagePath: "assets/ChickenCurryCupofNoodles.jpeg",
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
