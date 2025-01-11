import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Map<String, dynamic> profile = {
    'age': 25,
    'height': 170,
    'weight': 60,
    'gender': true,
    'activityLevel': 'Not Very Active', // Fixed typo
    'goal': 'Lose Weight', // Fixed typo
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          iconSize: 30.0,
          onPressed: () => Navigator.pop(context), // Added navigation
        ),
        title: const Text(
          "Nutrition",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Added scrolling support
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 20),
              const Text(
                'My Info',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(113, 52, 121, 40),
              Colors.white.withOpacity(0.9),
            ],
            stops: const [0.15, 0.15],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: const Text(
                "AB",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("ABC", style: TextStyle(fontSize: 30)),
                Text("abc@gmail.com"),
                Text("10234567890"),
              ],
            ),
            const Spacer(),
            IconButton(
              icon:
                  const Icon(Icons.edit_square, color: Colors.green, size: 30),
              onPressed: () {
                Navigator.pushNamed(context, '/EditProfile');
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    final List<MapEntry<String, String>> profileItems = [
      MapEntry('Age', '${profile['age']} Years'),
      MapEntry('Height', '${profile['height']} cm'),
      MapEntry('Weight', '${profile['weight']} kg'), // Fixed weight display
      MapEntry('Gender', profile['gender'] ? 'Male' : 'Female'),
      MapEntry('Goal', profile['goal']),
      MapEntry('Activity level', profile['activityLevel']),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: profileItems.map((item) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.key, style: const TextStyle(fontSize: 15)),
                    Text(item.value, style: const TextStyle(fontSize: 15)),
                  ],
                ),
                if (item != profileItems.last) const Divider(thickness: 1),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
