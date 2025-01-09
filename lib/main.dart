import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_application_1/base/FoodScan/result.dart';
import 'package:flutter_application_1/base/setting/page.dart';
import 'base/FoodScan/listResult.dart';
import 'base/profile/editProfile.dart';
import 'base/dashboard/page.dart';
import 'base/profile/profile.dart';
import 'base/Nutrition/page.dart';
import 'base/FoodScan/ScanFood.dart';
import 'base/setting/privacy&policy.dart';
import 'base/setting/terms&conditions.dart';
import 'base/step/step2.dart';
import 'base/step/step1.dart';
import 'base/step/step3.dart';
import 'base/step/step4.dart';
import 'base/step/step5.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Profile(),
    );
  }
}
