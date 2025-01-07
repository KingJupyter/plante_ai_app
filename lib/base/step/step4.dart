import 'package:flutter/material.dart';

class Step4 extends StatelessWidget {
  const Step4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 50),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  iconSize: 50.0,
                  onPressed: () {},
                ),
                Expanded(
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
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                "Your BMI, health status, and personalized calorie goal, guiding you toward achieving your wellness objectives",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                                constraints:
                                    BoxConstraints(minWidth: 0), // Auto width
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
                                    width: constraints.maxWidth *
                                        0.85, // 85% of the parent width
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
                              SizedBox(width: 20),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100))),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/BMI_result.svg',
                                      // height: 240,
                                      // width: 240,
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      "19.5",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(width: 40),
                              Spacer(),
                              Column(
                                children: [
                                  const Text(
                                    "Your BMI Result",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                      "You are healthy. \nTrack your daily \ncalorie needs.",
                                      softWrap: true,
                                      overflow: TextOverflow.clip),
                                ],
                              ),
                              SizedBox(width: 20)
                            ],
                          )
                        ],
                      ))),
              SizedBox(height: 20),
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
                                constraints:
                                    BoxConstraints(minWidth: 0), // Auto width
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
                                    width: constraints.maxWidth *
                                        0.85, // 85% of the parent width
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
                              SizedBox(width: 20),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100))),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/Daily_Calorie_Goal.svg',
                                      // height: 240,
                                      // width: 240,
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      "1750",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(width: 40),
                              Spacer(),
                              Column(
                                children: [
                                  const Text(
                                    "Daily Calorie Goal",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                      "According to your \nchoice, your goal is \nto lose your weight.",
                                      softWrap: true,
                                      overflow: TextOverflow.clip),
                                ],
                              ),
                              SizedBox(width: 20)
                            ],
                          )
                        ],
                      )))
            ],
          ),
        ),
        Spacer(),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF347928),
              foregroundColor: Colors.white,
              minimumSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("Next", style: TextStyle(fontSize: 20))),
        SizedBox(height: 50),
      ]),
    );
  }
}
