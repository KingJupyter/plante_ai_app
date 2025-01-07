import 'package:flutter/material.dart';
import 'package:flutter_application_1/Component/nutritionAnalysis.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Map<String, dynamic> nutrition = {
    "name": "Apple",
    "calories": 367,
    "nutrition": {"fat": 49, "carbs": 80, "protein": 80, "fiber": 80}
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple Nutrition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 100),

            // Title
            const Text(
              "Analyze Your Food",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Image Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Main Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/food_images/apple_pie.jpeg',
                        // height: 240,
                        // width: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Green Border
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Full-width Bar Chart
            nutritionAnalysis(nutrition: nutrition),
          ],
        ),
      ),
    );
  }
}
