import 'package:flutter/material.dart';

class Step5 extends StatelessWidget {
  const Step5({super.key});

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
                    "Account Created",
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
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/Success_check.png'),
              SizedBox(height: 20),
              const Text('Successfully!!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Text(
                'Your daily net goal is:',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                '2,240',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
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
            child: Text("Go to Dashboard", style: TextStyle(fontSize: 20))),
        SizedBox(height: 50),
      ]),
    );
  }
}
