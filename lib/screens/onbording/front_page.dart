import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 170,
          fit: BoxFit.cover,
        ),
        Text(
          "Expenz",
          style: TextStyle(
            fontSize: 50,
            color: kMainColor,
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    );
  }
}
