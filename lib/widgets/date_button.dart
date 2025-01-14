import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
  const DateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 170,
      decoration: BoxDecoration(
          color: kMainColor, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_month,
            color: kWhite,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Select Date",
            style: TextStyle(
                color: kWhite, fontSize: 15, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
