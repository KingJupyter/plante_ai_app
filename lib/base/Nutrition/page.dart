import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({super.key});

  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  int _check = 0; // 0 for Male, 1 for Female

  double round(double value) {
    return double.parse(value.toStringAsFixed(2)); // Keeps two decimal places
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap_calories = {
      "Breakfast": 42,
      "Lunch": 23,
      "Dinner": 12,
      "Snacks": 0,
    };

    final double totalCalories =
        dataMap_calories.values.fold(0, (sum, value) => sum + value);

    final Map<String, double> dataMap_percentage = totalCalories > 0
        ? {
            "Breakfast":
                round((dataMap_calories["Breakfast"]! / totalCalories) * 100),
            "Lunch": round((dataMap_calories["Lunch"]! / totalCalories) * 100),
            "Dinner":
                round((dataMap_calories["Dinner"]! / totalCalories) * 100),
            "Snacks":
                round((dataMap_calories["Snacks"]! / totalCalories) * 100),
          }
        : {
            "Breakfast": 0,
            "Lunch": 0,
            "Dinner": 0,
            "Snacks": 0,
          };

    // Colors for the pie chart
    final List<Color> colorList = [
      Colors.green.shade700,
      Colors.green.shade300,
      Colors.green.shade100,
      Colors.green.shade200,
    ];

    final Map<String, double> dataMap_macros = {
      "Carbohydrates": 91,
      "Fat": 5,
      "Protein": 4,
    };

    // Macronutrient data
    final List<Map<String, dynamic>> macros = [
      {
        "name": "Carbohydrates",
        "value": "11g",
        "total": "91%",
        "goal": "50%",
        "color": Colors.green.shade700
      },
      {
        "name": "Fat",
        "value": "1g",
        "total": "5%",
        "goal": "30%",
        "color": Colors.green.shade400
      },
      {
        "name": "Protein",
        "value": "1g",
        "total": "4%",
        "goal": "20%",
        "color": Colors.green.shade200
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          iconSize: 30,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Nutrition",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleSwitch(
                  minWidth: 150.0,
                  minHeight: 50.0,
                  cornerRadius: 15.0,
                  activeBgColors: [
                    [Colors.green[800]!],
                    [Colors.green[800]!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Color.fromARGB(111, 52, 121, 40),
                  inactiveFgColor: Colors.white,
                  initialLabelIndex:
                      _check, // Set initial label index based on _check
                  totalSwitches: 2,
                  labels: ['Calories', 'Macros'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                    setState(() {
                      _check = index!; // Update _check and call setState
                    });
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: _check == 0
                      ? Center(
                          child: Card(
                            margin: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Pie Chart
                                  PieChart(
                                    dataMap: dataMap_calories,
                                    animationDuration:
                                        const Duration(milliseconds: 800),
                                    chartLegendSpacing: 32,
                                    chartRadius:
                                        MediaQuery.of(context).size.width * 0.4,
                                    colorList: colorList,
                                    initialAngleInDegree: 0,
                                    // chartType: ChartType.ring,
                                    ringStrokeWidth: 16,
                                    legendOptions: const LegendOptions(
                                      showLegends: false,
                                    ),
                                    chartValuesOptions:
                                        const ChartValuesOptions(
                                      showChartValues: true,
                                      showChartValuesInPercentage: true,
                                      showChartValuesOutside: false,
                                      decimalPlaces: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Grid-like layout for items
                                  GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 3,
                                    children: [
                                      _buildGridItem(
                                          "Breakfast",
                                          "${dataMap_percentage['Breakfast']}%",
                                          "${dataMap_calories['Breakfast']} Cal",
                                          Colors.green.shade700),
                                      _buildGridItem(
                                          "Lunch",
                                          "${dataMap_percentage['Lunch']}%",
                                          "${dataMap_calories['Lunch']} Cal",
                                          Colors.green.shade300),
                                      _buildGridItem(
                                          "Dinner",
                                          "${dataMap_percentage['Dinner']}%",
                                          "${dataMap_calories['Dinner']} Cal",
                                          Colors.green.shade100),
                                      _buildGridItem(
                                          "Snacks",
                                          "${dataMap_percentage['Snacks']}%",
                                          "${dataMap_calories['Snacks']} Cal",
                                          Colors.green.shade200),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // Footer details
                                  const Divider(thickness: 1),
                                  _buildFooterRow(
                                      "Total Calories", "${totalCalories}"),
                                  const Divider(thickness: 1),
                                  _buildFooterRow("Goal", "1920",
                                      color: Colors.green),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Card(
                            margin: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Pie Chart
                                  PieChart(
                                    dataMap: dataMap_macros,
                                    animationDuration:
                                        const Duration(milliseconds: 800),
                                    chartLegendSpacing: 32,
                                    chartRadius:
                                        MediaQuery.of(context).size.width * 0.4,
                                    colorList: colorList,
                                    initialAngleInDegree: 0,
                                    // chartType: ChartType.ring,
                                    ringStrokeWidth: 16,
                                    legendOptions: const LegendOptions(
                                      showLegends: false,
                                    ),
                                    chartValuesOptions:
                                        const ChartValuesOptions(
                                      showChartValues: false,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Macronutrient List
                                  Column(
                                    children: macros.map((macro) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Row(
                                          children: [
                                            // Macro Color Indicator
                                            Container(
                                              width: 16,
                                              height: 16,
                                              color: macro["color"],
                                            ),
                                            const SizedBox(width: 8),
                                            // Macro Name and Value
                                            Expanded(
                                              child: Text(
                                                "${macro['name']} (${macro['value']})",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            // Macro Total
                                            Text(
                                              macro["total"],
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            const SizedBox(width: 16),
                                            // Macro Goal
                                            Text(
                                              macro["goal"],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

// Helper method to build grid items
Widget _buildGridItem(
    String title, String percentage, String calories, Color color) {
  return Row(
    children: [
      Container(
        width: 16,
        height: 16,
        color: color,
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text("$percentage ($calories)", style: const TextStyle(fontSize: 12)),
        ],
      ),
    ],
  );
}

// Helper method to build footer rows
Widget _buildFooterRow(String title, String value,
    {Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        Text(
          value,
          style: TextStyle(
              fontSize: 14, color: color, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
