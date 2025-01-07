import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../Component/bmi_parameters.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  double _age = 20;
  double _height = 1.8;
  double _weight = 85;
  double _waist = 100;
  int _selectedGenderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "What’s Your BMI?",
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "We need your sex, current age, height and weight to accurately calculate your BMI and calorie needs.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                  inactiveBgColor: const Color.fromARGB(111, 52, 121, 40),
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: _selectedGenderIndex,
                  totalSwitches: 2,
                  labels: const ['Male', 'Female'],
                  radiusStyle: true,
                  onToggle: (index) {
                    setState(() {
                      _selectedGenderIndex = index!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                BMI_Parameters(
                  data: UserData(
                    age: _age,
                    height: _height,
                    weight: _weight,
                    waist: _waist,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Proceed to the next step
              print("Next Button Pressed");
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
