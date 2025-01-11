import 'package:flutter/material.dart';
import '../../Components/nutritionAnalysis.dart';

class Result extends StatefulWidget {
  const Result({
    super.key,
  });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final Map<String, dynamic> nutrition = {
    "name": "Apple",
    "calories": 367,
    "nutrition": {"fat": 49, "carbs": 80, "protein": 80, "fiber": 80}
  };

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/food_images/apple_pie.jpeg',
                        height: screenSize.height * 0.3,
                        width: screenSize.width * 0.9,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
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
            nutritionAnalysis(nutrition: nutrition),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
