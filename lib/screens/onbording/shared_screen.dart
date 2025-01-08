import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SharedScreen extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String discription;

  const SharedScreen({super.key, required this.imgUrl, required this.title, required this.discription});

  @override
  State<SharedScreen> createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.imgUrl,
          width: 300,
          fit: BoxFit.cover,
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        Text(
          widget.discription,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: kGrey),
        )
      ],
    );
  }
}
