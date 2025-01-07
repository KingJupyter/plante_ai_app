import 'package:flutter/material.dart';

class nutritionAnalysis extends StatelessWidget {
  const nutritionAnalysis({super.key, required this.nutrition});
  final Map<String, dynamic> nutrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Incorrect parameter
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nutrition['name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nutrition Value : ${nutrition['calories']}kcal",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 8),
          Center(
            child: SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(33, 52, 121, 40),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            height: 200 *
                                ((nutrition['nutrition']['protein'] as num) /
                                        100)
                                    .toDouble(),
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(113, 52, 121, 40),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Protein",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${nutrition['nutrition']['protein']}%',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(33, 52, 121, 40),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            height: 200 *
                                ((nutrition['nutrition']['fat'] as num) / 100)
                                    .toDouble(),
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(113, 52, 121, 40),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fat",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${nutrition['nutrition']['fat']}%',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(33, 52, 121, 40),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            height: 200 *
                                ((nutrition['nutrition']['carbs'] as num) / 100)
                                    .toDouble(),
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(113, 52, 121, 40),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Carbs",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${nutrition['nutrition']['carbs']}%',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(33, 52, 121, 40),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            height: 200 *
                                ((nutrition['nutrition']['fiber'] as num) / 100)
                                    .toDouble(),
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(113, 52, 121, 40),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fiber",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${nutrition['nutrition']['fiber']}%',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
