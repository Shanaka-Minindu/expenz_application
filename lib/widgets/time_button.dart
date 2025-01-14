import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 170,
      decoration: BoxDecoration(
          color: kYellow, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timer,
            color: kWhite,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Select Time",
            style: TextStyle(
                color: kWhite, fontSize: 15, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
