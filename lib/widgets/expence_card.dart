import 'dart:ffi';

import 'package:expenz_app/models/expence_model.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenceCard extends StatelessWidget {
  final String title;
  final String discription;
  final Expence category;
  final DateTime time;
  final double amount;
  const ExpenceCard(
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
                    color: expenceCatogoryColors[category]?.withOpacity(.20),
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset(
                    expenceCatogoryImage[category]!,
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
                          overflow: TextOverflow.ellipsis),
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
                "- \$$amount",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: kRed),
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
