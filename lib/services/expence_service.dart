import 'dart:convert';

import 'package:expenz_app/models/expence_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenceService {
  List<ExpenceModel> expencesList = [];

  //Define the key for storing expensece
  static const String _expenceKey = 'expenses';

  //save the expences in shared prefferences

  Future<void> saveExpence(ExpenceModel expence, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? exsistingExpenses = prefs.getStringList(_expenceKey);

      // convert string list to Object list
      List<ExpenceModel> exsistingExpensesObjects = [];

      if (exsistingExpenses != null) {
        exsistingExpensesObjects = exsistingExpenses
            .map((e) => ExpenceModel.fromJSON(json.decode(e)))
            .toList();
      }

      exsistingExpensesObjects.add(expence);

      List<String> updatedExpenses =
          exsistingExpensesObjects.map((e) => json.encode(e.toJSON())).toList();

      await prefs.setStringList(_expenceKey, updatedExpenses);

//show snackbar

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Expenses added successfully"),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ExpenceModel>> loadExpenses() async {
    List<ExpenceModel> exsistingExpensessObjects = [];
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? exsistingExpenses = prefs.getStringList(_expenceKey);

      if (exsistingExpenses != null) {
        exsistingExpensessObjects = exsistingExpenses
            .map((e) => ExpenceModel.fromJSON(json.decode(e)))
            .toList();
      }
    } catch (e) {
      print(e.toString());
    }
    return exsistingExpensessObjects;
  }
}
