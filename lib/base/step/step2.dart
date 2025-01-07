import 'package:flutter/material.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

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
                    "What’s your baseline activity level?",
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
            const Text(
              "Not including workouts - we count that separately.",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(221, 52, 121, 40),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: Column(children: [
                  Text("Sedentary",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    "Little or No Exercise (e.g., Primarily desk-bound job, minimal daily movement).",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(80, 118, 214, 101),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: Column(children: [
                  Text("Lightly Active",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    "Light Exercise 1–3 Days/Week (e.g., Some moderate walks or short workouts each week).",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(80, 118, 214, 101),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: Column(children: [
                  Text("Moderately Active",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    "Moderate Exercise 3–5 Days/Week (e.g.,  Regular workouts - running, cycling, gym -  most days of the week).",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(80, 118, 214, 101),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: Column(children: [
                  Text("Very Active",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    "Hard Exercise 6–7 Days/Week (e.g.,  Intense training or physically demanding job nearly every day).",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(80, 118, 214, 101),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: Column(children: [
                  Text("Extra Active",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    "Very Hard Exercise, Possibly 2×/Day (e.g.,  Elite athlete or someone doing intense physical training twice a day, plus a very active job).",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ]),
              ),
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
