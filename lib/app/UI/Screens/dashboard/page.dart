import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Components/dailyMacros.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static const name = "John Doe";
  static const defaultNutrition = {
    "nutrition": {"fat": 49, "carbs": 80, "protein": 80, "fiber": 80},
    "goal": {"fat": 49, "carbs": 80, "protein": 80, "fiber": 80},
  };

  final Map<String, dynamic> nutrition = defaultNutrition;

  static const double TARGET_WEIGHT = 50.0;
  static const double STARTING_WEIGHT = 105.0;
  double currentWeight = 55.0;
  late final double progressValue;

  @override
  void initState() {
    super.initState();
    try {
      progressValue = (STARTING_WEIGHT - currentWeight) /
          (STARTING_WEIGHT - TARGET_WEIGHT).abs();
    } catch (e) {
      progressValue = 0.0;
      debugPrint('Error calculating progress: $e');
    }
  }

  Widget _buildScoreRow(String label, String iconPath, int score) {
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(iconPath, width: 24, height: 24),
            const SizedBox(width: 8),
            Text(label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(width: 16),
            Text("$score",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Profile');
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  "${name}'s App",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Setting');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth > 600 ? 32.0 : 16.0),
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("Today", textAlign: TextAlign.left),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              height: 350,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(113, 52, 121, 40),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  width: constraints.maxWidth * 0.85,
                                  height: 350,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        226, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 20),
                            Center(
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 10,
                                  ),
                                ),
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "1590",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Remaining",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Calories",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "BBS = (0.4 × HWR) + (0.3 × WTH)\n+ (0.2 × Activity) + (0.1 × Diet)",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildScoreRow(
                                      "BB Score", "assets/images/goal.png", 0),
                                  _buildScoreRow(
                                      "HWR Score", "assets/images/goal.png", 0),
                                  _buildScoreRow(
                                      "WTH Score", "assets/images/diet.png", 0),
                                  _buildScoreRow("Activity Score",
                                      "assets/images/activity.png", 0),
                                  _buildScoreRow("Diet Score",
                                      "assets/images/diet.png", 0),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Macros"),
                  DailyMacros(nutrition: nutrition),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  width: 600,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: 300,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              startAngle: 135,
                              endAngle: 45,
                              minimum: TARGET_WEIGHT,
                              maximum: STARTING_WEIGHT,
                              showTicks: false,
                              showLabels: false,
                              axisLineStyle: AxisLineStyle(
                                thickness: 20,
                                cornerStyle: CornerStyle.bothFlat,
                                color: Colors.grey[300],
                              ),
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: TARGET_WEIGHT,
                                  endValue: TARGET_WEIGHT +
                                      (STARTING_WEIGHT - TARGET_WEIGHT) * 0.25,
                                  color: Colors.green,
                                ),
                                GaugeRange(
                                  startValue: TARGET_WEIGHT +
                                      (STARTING_WEIGHT - TARGET_WEIGHT) * 0.25,
                                  endValue: TARGET_WEIGHT +
                                      (STARTING_WEIGHT - TARGET_WEIGHT) * 0.5,
                                  color: Colors.yellow,
                                ),
                                GaugeRange(
                                  startValue: TARGET_WEIGHT +
                                      (STARTING_WEIGHT - TARGET_WEIGHT) * 0.5,
                                  endValue: TARGET_WEIGHT +
                                      (STARTING_WEIGHT - TARGET_WEIGHT) * 0.75,
                                  color: Colors.yellow,
                                ),
                                GaugeRange(
                                  startValue: TARGET_WEIGHT +
                                      (STARTING_WEIGHT - TARGET_WEIGHT) * 0.75,
                                  endValue: STARTING_WEIGHT,
                                  color: Colors.red,
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: currentWeight,
                                  needleColor: Colors.grey[800],
                                  knobStyle: KnobStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Text(
                                    TARGET_WEIGHT.toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  angle: 135,
                                  positionFactor: 1.2,
                                ),
                                GaugeAnnotation(
                                  widget: Text(
                                    STARTING_WEIGHT.toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  angle: 45,
                                  positionFactor: 1.2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 150),
                          Text(
                            '${(STARTING_WEIGHT - currentWeight).abs().toStringAsFixed(1)} kg ${currentWeight <= STARTING_WEIGHT ? 'lost' : 'gained'}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Current: ${currentWeight.toStringAsFixed(1)} kg',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Dashboard');
              },
            ),
            const SizedBox(width: 60), // Space for the FAB
            IconButton(
              icon: Icon(
                Icons.format_list_bulleted,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/ScanFoodListResult');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            // Action for FAB
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
