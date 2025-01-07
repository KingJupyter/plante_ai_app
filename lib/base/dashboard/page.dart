import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget _buildScoreRow(String label, String iconPath, int score) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            "$score",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Today",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Center(
                child: Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(113, 52, 121, 40),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                width: constraints.maxWidth * 0.85,
                                height: 150,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(226, 255, 255, 255),
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
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "1590",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Text(
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
                                  "BBS = (0.4 × HWR) + (0.3 × WTH)\n"
                                  "+ (0.2 × Activity) + (0.1 × Diet)",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 16),
                                _buildScoreRow(
                                  "HWR Score",
                                  "assets/images/food.png", // Replace with your asset path
                                  0,
                                ),
                                _buildScoreRow(
                                  "WTH Score",
                                  "assets/images/scale.png", // Replace with your asset path
                                  0,
                                ),
                                _buildScoreRow(
                                  "Activity Score",
                                  "assets/images/activity.png", // Replace with your asset path
                                  0,
                                ),
                                _buildScoreRow(
                                  "Diet Score",
                                  "assets/images/diet.png", // Replace with your asset path
                                  0,
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
