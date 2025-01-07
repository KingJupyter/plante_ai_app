import 'package:flutter/material.dart';

class UserData {
  double age;
  double height;
  double weight;
  double waist;

  UserData({
    required this.age,
    required this.height,
    required this.weight,
    required this.waist,
  });
}

class BMI_Parameters extends StatefulWidget {
  final UserData data;

  const BMI_Parameters({Key? key, required this.data}) : super(key: key);

  @override
  State<BMI_Parameters> createState() => _BMI_ParametersState();
}

class _BMI_ParametersState extends State<BMI_Parameters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSlider(
            label: "Age",
            value: widget.data.age,
            min: 0,
            max: 100,
            unit: "",
            onChanged: (value) {
              setState(() {
                widget.data.age = value;
              });
            },
          ),
          const SizedBox(height: 16),
          buildSlider(
            label: "Height",
            value: widget.data.height,
            min: 0,
            max: 3,
            unit: "m",
            onChanged: (value) {
              setState(() {
                widget.data.height = value;
              });
            },
          ),
          const SizedBox(height: 16),
          buildSlider(
            label: "Weight",
            value: widget.data.weight,
            min: 0,
            max: 300,
            unit: "kg",
            onChanged: (value) {
              setState(() {
                widget.data.weight = value;
              });
            },
          ),
          const SizedBox(height: 16),
          buildSlider(
            label: "Waist circumference",
            value: widget.data.waist,
            min: 0,
            max: 200,
            unit: "cm",
            onChanged: (value) {
              setState(() {
                widget.data.waist = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required String unit,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "$label : ",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              unit.isEmpty
                  ? "${value.round()}"
                  : "${value.toStringAsFixed(2)} $unit",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          label: value.toString(),
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
