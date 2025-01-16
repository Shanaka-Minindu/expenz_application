import 'package:flutter/material.dart';

enum Income { salary, freelance, passiveIncome, sales }

//income images

final Map<Income, String> incomeCatogoryImage = {
  Income.freelance: "assets/images/freelance.png",
  Income.salary: "assets/images/health.png",
  Income.passiveIncome: "assets/images/car.png",
  Income.sales: "assets/images/salary.png",
};

// income colors

final Map<Income, Color> incomeCatogoryColor = {
  Income.salary: Color.fromARGB(255, 248, 232, 0),
  Income.passiveIncome: Color(0xff0D0E0F),
  Income.freelance: Color(0xffE57373),
  Income.sales: Color(0xff64B5F6),
};

class IncomeModel {
  final int id;
  final String title;
  final String discription;
  final double amount;
  final DateTime date;
  final DateTime time;
  final Income catogory;

  IncomeModel(
      {required this.id,
      required this.title,
      required this.discription,
      required this.amount,
      required this.date,
      required this.time,
      required this.catogory});

// Convert income object to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "discription": discription,
      "amount": amount,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
      "catogory": catogory.index,
    };
  }

//convert Json to Income object

  factory IncomeModel.fromJson(Map<String, dynamic> objName) {
    return IncomeModel(
        id: objName['id'],
        title: objName['title'],
        discription: objName['discription'],
        amount: objName['amount'],
        date: DateTime.parse(objName['date']),
        time: DateTime.parse(objName['time']),
        catogory: Income.values[objName['catogory']]);
  }
}
