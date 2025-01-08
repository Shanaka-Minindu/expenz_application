import 'package:expenz_app/screens/onboarding_screen.dart';
import 'package:expenz_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Inter"),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(kDefalutPadding),
          child: OnboardingScreen(),
        ),
      ),
    );
  }
}
