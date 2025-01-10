import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class InExpenseCard extends StatefulWidget {
  final String title;
  final double amount;
  final String imgUrl;
  final Color bgColor;
  const InExpenseCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.imgUrl,
      required this.bgColor});

  @override
  State<InExpenseCard> createState() => _InExpenseCardState();
}

class _InExpenseCardState extends State<InExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .43,
      height: 90,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(widget.imgUrl),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: kWhite),
              ),
              Text(
                "\$${widget.amount.toStringAsFixed(0)}",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w600, color: kWhite),
              )
            ],
          )
        ],
      ),
    );
  }
}
