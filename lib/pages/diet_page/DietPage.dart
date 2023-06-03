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
  late Meal meal;
  late int calorie = 0;
   
    late TabController _tabController;
    final selectedColor = const Color(0xff1a73e8);
    final unselectedColor = const Color(0xff5f6368);


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
                                if(calorie<=2400)
                                  for (int i = 0; i < kcal2000_MENU1.length; i++)
                                     _MealCard(meal: kcal2000_MENU1[i]),
                                if(calorie>2400)   
                                  for (int i = 0; i < kcal2500_MENU1.length; i++)
                                     _MealCard(meal: kcal2500_MENU1[i]),
                                
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 32),
                                for (int i = 0; i < kcal2000_MENU2.length; i++)
                                  _MealCard(meal: kcal2000_MENU2[i]),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 32),
                                for (int i = 0; i < kcal2000_MENU3.length; i++)
                                  _MealCard(meal: kcal2000_MENU3[i]),
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
                padding: const EdgeInsets.only(left: 10.0),
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
