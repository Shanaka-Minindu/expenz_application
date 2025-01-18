import 'package:flutter/material.dart';

enum Expence { shopping, subscription, food, health, transport }

//Expence image
final Map<Expence, String> expenceCatogoryImage = {
  Expence.food: "assets/images/restaurant.png",
  Expence.transport: "assets/images/car.png",
  Expence.health: "assets/images/health.png",
  Expence.shopping: "assets/images/bag.png",
  Expence.subscription: "assets/images/bill.png",
};

//Expencr color
final Map<Expence, Color> expenceCatogoryColors = {
  Expence.food: const Color(0xFFE57373),
  Expence.transport: const Color(0xFF81C784),
  Expence.health: const Color(0xFF64B5F6),
  Expence.shopping: const Color(0xFFFFD54F),
  Expence.subscription: const Color(0xFF9575CD),
};

class ExpenceModel {
  final int id;
  final String title;
  final String discription;
  final double amount;
  final DateTime date;
  final DateTime time;
  final Expence expence;

  ExpenceModel(
      {required this.id,
      required this.title,
      required this.discription,
      required this.amount,
      required this.date,
      required this.time,
      required this.expence});

// convert the Expnce object to a json object
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'discription': discription,
      'amount': amount,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'expence': expence.index,
    };
  }
// convert the Json to the Expence object
  factory ExpenceModel.fromJSON(Map<String, dynamic> objName) {
    return ExpenceModel(
        id: objName["id"],
        title: objName["title"],
        discription: objName['discription'],
        amount: objName['amount'],
        date: DateTime.parse(objName['date']),
        time: DateTime.parse(objName['time']),
        expence: Expence.values[objName['expence']]);
  }



  
}
