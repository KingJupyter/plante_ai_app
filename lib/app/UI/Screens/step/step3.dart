import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../Components/bmi_parameters.dart';

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
  final ValueNotifier<int> _selectedGenderIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _selectedGenderIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Custom height for the AppBar
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
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "We need your sex, current age, height and weight to accurately calculate your BMI and calorie needs.",
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
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: _selectedGenderIndexNotifier,
                  builder: (context, selectedIndex, _) {
                    return ToggleSwitch(
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
                      initialLabelIndex: selectedIndex,
                      totalSwitches: 2,
                      labels: const ['Male', 'Female'],
                      radiusStyle: true,
                      onToggle: (index) {
                        _selectedGenderIndexNotifier.value = index!;
                      },
                    );
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
              Navigator.pushNamed(context, '/Step4');
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
