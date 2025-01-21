import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IncomeProggrassBar extends StatelessWidget {
  final Color color;
  final String title;
  final double amount;
  final double total;

  const IncomeProggrassBar(
      {super.key,
      required this.color,
      required this.title,
      required this.amount,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: kGrey.withOpacity(.05),
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(color: kGrey.withOpacity(.1), width: 1)),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: color),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Text(
                  "+\$$amount",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 17, 203, 0)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          LinearPercentIndicator(
            barRadius: Radius.circular(50),
            animation: true,
            lineHeight: 15.0,
            animationDuration: 500,
            percent: amount == 0 ? 0 : amount / total,
            progressColor: color,
          ),
        ],
      ),
    );
  }
}
