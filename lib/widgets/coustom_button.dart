import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  final String butText;
  final Color color;
  final Color textColor;
  const CoustomButton(
      {super.key,
      required this.butText,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
          child: Text(
        butText,
        style: TextStyle(
            fontSize: 18, color: textColor, fontWeight: FontWeight.w800),
      )),
    );
  }
}
