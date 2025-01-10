import 'package:expenz_app/screens/main_screen.dart';
import 'package:expenz_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Warpper extends StatefulWidget {
  final bool showMainScreen;
  const Warpper({super.key, required this.showMainScreen});

  @override
  State<Warpper> createState() => _WarpperState();
}

class _WarpperState extends State<Warpper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainScreen ? MainScreen() : OnboardingScreen();
  }
}
