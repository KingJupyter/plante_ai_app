import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class Step4 extends StatelessWidget {
  const Step4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150), // Custom height for AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        iconSize: 50.0,
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                      const Expanded(
                        child: Text(
                          "Wellness Overview",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Your BMI, health status, and personalized calorie goal, guiding you toward achieving your wellness objectives.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
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
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  width: constraints.maxWidth * 0.85,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        226, 255, 255, 255),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
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
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/BMI_result.svg', // Update this line
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    "19.5",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: const [
                                Text(
                                  "Your BMI Result",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "You are healthy. \nTrack your daily \ncalorie needs.",
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Card(
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
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  width: constraints.maxWidth * 0.85,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        226, 255, 255, 255),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
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
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Daily_Calorie_Goal.svg', // Update this line
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    "1750",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: const [
                                Text(
                                  "Daily Calorie Goal",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "According to your \nchoice, your goal is \nto lose your weight.",
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Step5');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF347928),
              foregroundColor: Colors.white,
              minimumSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Next", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
