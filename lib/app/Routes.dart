import 'package:flutter/material.dart';
import 'UI/Screens/LogIn/page.dart';
import 'UI/Screens/SignUp/page.dart';
import 'UI/Screens/profile/profile.dart';
import 'UI/Screens/setting/page.dart';
import 'UI/Screens/FoodScan/result.dart';
import 'UI/Screens/FoodScan/listResult.dart';
import 'UI/Screens/Nutrition/page.dart';
import 'UI/Screens/dashboard/page.dart';
import 'UI/Screens/OnBoarding/page.dart';
import 'UI/Screens/profile/editProfile.dart';
import 'UI/Screens/setting/privacy&policy.dart';
import 'UI/Screens/setting/terms&conditions.dart';
import 'UI/Screens/step/step1.dart';
import 'UI/Screens/step/step2.dart';
import 'UI/Screens/step/step3.dart';
import 'UI/Screens/step/step4.dart';
import 'UI/Screens/step/step5.dart';
// Adjust the file name accordingly

// A function returning a map of routes for the application.
Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (context) => OnBoarding(), // Home screen routecreen route
    // '/home': (context) => OnBoarding(),r
    '/Dashboard': (context) => Dashboard(),
    '/ScanFoodListResult': (context) => ListResult(),
    '/ScanFoodResult': (context) => Result(),
    // '/profile': (context) => ScanFood(
    //       camera: null,
    //     ),
    '/LogIn': (context) => LogIn(),
    '/ScanFood': (context) => SignUp(),
    '/Nutrition': (context) => Nutrition(),
    '/EditProfile': (context) => EditProfile(),
    '/Profile': (context) => Profile(),
    '/Setting': (context) => Setting(),
    '/privacy-policy': (context) => PrivacyAndPolicy(),
    '/terms': (context) => TermsAndConditions(),
    '/SignUp': (context) => SignUp(),
    '/Step1': (context) => Step1(),
    '/Step2': (context) => Step2(),
    '/Step3': (context) => Step3(),
    '/Step4': (context) => Step4(),
    '/Step5': (context) => Step5(),
  };
}
