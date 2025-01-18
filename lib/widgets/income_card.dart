import 'package:expenz_app/models/income_model.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final String discription;
  final Income category;
  final DateTime time;
  final double amount;
  const IncomeCard(
      {super.key,
      required this.title,
      required this.discription,
      required this.category,
      required this.time,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    color: incomeCatogoryColor[category]?.withOpacity(.20),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: Image.asset(
                      incomeCatogoryImage[category]!,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      discription,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: kGrey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+ \$$amount",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: kGreen),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                DateFormat.jm().format(time),
                style: TextStyle(
                    fontSize: 11, fontWeight: FontWeight.w500, color: kGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
