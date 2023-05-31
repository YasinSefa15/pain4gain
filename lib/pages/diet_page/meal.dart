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
final Overweight_MENU1 = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Toasted Brown Bread ",
      kiloCaloriesBurnt: "86",
      timeTaken: "5",
      imagePath: "assets/greenchutney.jpeg",
      ingredients: [
        " 2 slices of brown bread",
"2 tablespoon brown sugar",
"2-3 tablespoon butter or ghee",
      ],
      preparation:
          '''Take a small bowl and mix the brown sugar with melted butter or ghee.
Spread the brown sugar mixture on the bread slice with the help of a spoon.
Heat a tava or nonstick pan, toast the bread on both the sides until the sugar melts and caramelizes or the bread is crispy.
Enjoy with hot tea or milk 🙂 .
..'''),
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
