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
  String username = '';
   
    late TabController _tabController;
    final selectedColor = Color(0xff1a73e8);
    final unselectedColor = Color(0xff5f6368);

  final List<Meal> menu1Meals = [
    Meal(name: 'Meal 1', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),
    Meal(name: 'Meal 2', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),
    Meal(name: 'Meal 3', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),
  ];

  final List<Meal> menu2Meals = [
    Meal(name: 'Meal 1', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),
    Meal(name: 'Meal 2', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),
    Meal(name: 'Meal 3', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),

  ];

  final List<Meal> menu3Meals = [
    Meal(name: 'Meal 1', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),
    Meal(name: 'Meal 2', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),
    Meal(name: 'Meal 3', mealTime: '', imagePath: '', kiloCaloriesBurnt: '', timeTaken: '', preparation: '', ingredients: []),

  ];

    final tabs = [
      Tab(text: 'MENU 1'),
      Tab(text: 'MENU 2'),
      Tab(text: 'MENU 3'),
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
    getUsername();
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
                borderRadius: BorderRadius.vertical(
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
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ), //gün ay bilgisi çekilcek
                          subtitle: Text(
                            "Hello, $username",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 19,
                                color: Colors.black),
                          ), //isim bilgisi yansıyacak
                          trailing: ClipOval(
                              child: Image.asset(
                            "assets/emirhan.jpg",
                          )) //kamera resmi alınacak,
                          ),
                      Row(
                        children: <Widget>[
                          _RadialProgress(
                            width: width * 0.37,
                            height: width * 0.37,
                            progress: 0.7,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _IngredientProgress(
                                ingredient: "Protein",
                                progress: 0.3,
                                progressColor: Colors.green,
                                leftAmount: 72,
                                width: width * 0.28,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              _IngredientProgress(
                                ingredient: "Carbs",
                                progress: 0.2,
                                progressColor: Colors.red,
                                leftAmount: 252,
                                width: width * 0.28,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              _IngredientProgress(
                                ingredient: "Fat",
                                progress: 0.1,
                                progressColor: Colors.yellow,
                                leftAmount: 61,
                                width: width * 0.28,
                              ),
                            ],
                          )
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
                                SizedBox(width: 32),
                                for (int i = 0; i < menu1Meals.length; i++)
                                  _MealCard(meal: menu1Meals[i]),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 32),
                                for (int i = 0; i < menu2Meals.length; i++)
                                  _MealCard(meal: menu2Meals[i]),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 32),
                                for (int i = 0; i < menu3Meals.length; i++)
                                  _MealCard(meal: menu3Meals[i]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
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

  Future<void> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');

    username = storedUsername!;
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
}

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
          style: TextStyle(
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  const _RadialProgress(
      {
      required this.height,
      required this.width,
      required this.progress});
  final double height, width, progress;

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
                  text: "1731", // kalan ihriyac yemeğin değeri girilecek
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087),
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
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        mathe.radians(-90), mathe.radians(-relativeProgress), false, paint);
    // grafiğin dönmesi vs yapılacak
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
