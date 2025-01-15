import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  int _selectedButtonIndex = -1;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });

    // Determine the goal value based on the index
    String goal = "";
    switch (index) {
      case 0:
        goal = "Sedentary";
        break;
      case 1:
        goal = "Maintain my current body balance score";
        break;
      case 2:
        goal = "Lose weight";
        break;
      case 3:
        goal = "Gain Weight";
        break;
      case 4:
        goal = "Gain lean muscle mass";
        break;
    }

    // Save goal to Firebase Firestore
    _firestore.collection('users').doc('yourUserId').set({
      'goal': goal,
    }).then((_) {
      print("Goal saved successfully!");
    }).catchError((error) {
      print("Error saving goal: $error");
    });
  }

  Widget _buildGoalButton(String text, int index) {
    return ElevatedButton(
      onPressed: () => _onButtonPressed(index),
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedButtonIndex == index
            ? Color.fromARGB(221, 52, 121, 40)
            : Color.fromARGB(80, 118, 214, 101),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        minimumSize: Size(450, 100),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // Increased height
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
                top: 30, left: 10, right: 10), // Added side padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left),
                      iconSize: 50.0,
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Text(
                        "What’s Your Goal?",
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
                const Text(
                  "We’ll personalize recommendations based on your goal.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGoalButton("Sedentary", 0),
                const SizedBox(height: 20),
                _buildGoalButton(
                    "Maintain my current \n body balance score", 1),
                const SizedBox(height: 20),
                _buildGoalButton("Lose weight", 2),
                const SizedBox(height: 20),
                _buildGoalButton("Gain Weight", 3),
                const SizedBox(height: 20),
                _buildGoalButton("Gain lean muscle mass", 4),
              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Step2');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF347928),
              foregroundColor: Colors.white,
              minimumSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("Next", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
