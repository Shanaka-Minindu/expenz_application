import 'package:flutter/material.dart';

class BodgetScreen extends StatefulWidget {
  const BodgetScreen({super.key});

  @override
  State<BodgetScreen> createState() => _BodgetScreenState();
}

class _BodgetScreenState extends State<BodgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Bodget"),),);
  }
}