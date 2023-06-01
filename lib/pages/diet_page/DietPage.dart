import 'package:flutter/material.dart';
import 'package:pain4gain/pages/diet_page/meal_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vector_math/vector_math_64.dart' as mathe;
import 'package:intl/intl.dart';
import 'package:pain4gain/pages/diet_page/meal.dart';
import 'package:animations/animations.dart';

class DietPage extends StatefulWidget {
  const DietPage({Key? key}) : super(key: key);
  @override
  State<DietPage> createState() => DietPageState();
}

class DietPageState extends State<DietPage> with SingleTickerProviderStateMixin{
  late int calorie = 0;
   
    late TabController _tabController;
    final selectedColor = const Color(0xff1a73e8);
    final unselectedColor = const Color(0xff5f6368);

  final List<Meal> menu1Meals = [
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
      preparation:
          '''Cut the cherry tomatoes, red pepper and spinach leaves.
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
      preparation:
          '''Toast bread if desired.
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

  final List<Meal> menu2Meals = [
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
      preparation:
          '''Gather all ingredients.
          Stir soy sauce, brown sugar, ginger, and red pepper flakes together in a bowl until sugar dissolves. Mix water and cornstarch together in a small bowl; stir with a whisk until cornstarch dissolves completely.
          Heat oil in a large skillet over high heat. Fry chicken and onion in hot oil until chicken is no longer pink in the center and onion is tender, 5 to 7 minutes.
Stir in broccoli with chicken and onion; sauté until broccoli is hot, about 5 minutes.
Push chicken and vegetable mixture to the side of the skillet. Pour soy sauce mixture into the vacant part of the skillet. Stir cornstarch slurry into soy sauce mixture until the color is consistent.
Move chicken and vegetables back into the center of the pan; sauté until sauce thickens and coats chicken and vegetables, about 5 minutes more.
'''),
];

  final List<Meal> menu3Meals =  [
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
    final tabs = [
      const Tab(text: 'MENU 1'),
      const Tab(text: 'MENU 2'),
      const Tab(text: 'MENU 3'),
    ];

 @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
   setState(() {
      getDailyCalorie();
   });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();
  
     
 
    return Scaffold(
        backgroundColor: const Color(0xFFE9E9E9),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              height: height * 0.35,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 10, left: 32, right: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                          title: Text(
                            " ${DateFormat("EEEE").format(today)},${DateFormat(" d MMM yyyy").format(today)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ), //gün ay bilgisi çekilcek
                          subtitle: const Text(
                            "Your daily calories and menu",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _RadialProgress(
                            width: width * 0.37,
                            height: width * 0.37,
                            progress: 0.7,
                            calorie: calorie,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.36,
              left: 0,
              right: 0,
              child:  Container(
              height: kToolbarHeight - 8.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: selectedColor),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: tabs,
                onTap: (index) {
                  setState(() {
                    _tabController.index = index;
                  });
                },
              ),

            ),
            ),

            Positioned(
              top: height * 0.43,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 8,
                        left: 32,
                        right: 16,
                      ),
                      child: Text(
                        "MEALS FOR TODAY",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 32),
                                for (int i = 0; i < menu1Meals.length; i++)
                                  _MealCard(meal: menu1Meals[i]),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 32),
                                for (int i = 0; i < menu2Meals.length; i++)
                                  _MealCard(meal: menu2Meals[i]),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 32),
                                for (int i = 0; i < menu3Meals.length; i++)
                                  _MealCard(meal: menu3Meals[i]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void getDailyCalorie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      calorie = (prefs.getInt('calorie') ?? 0);
    });
  }

}
class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    meal: meal,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.redAccent,
                      ),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.purpleAccent,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key? key,
      required this.ingredient,
      required this.leftAmount,
      required this.progress,
      required this.progressColor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}
*/

class _RadialProgress extends StatelessWidget {
  const _RadialProgress(
      {
      required this.height,
      required this.width,
      required this.progress,
      required this.calorie});
  final double height, width, progress;
  final int calorie;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(
        progress: 0.7,
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$calorie",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF200087),
                  ),
                ),
                const TextSpan(text: "\n"),
                const TextSpan(
                  text: "cal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = const Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        mathe.radians(-90), mathe.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //TODO: implement shouldRepaint
    return true;
  }
}

/*class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    meal: meal,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
