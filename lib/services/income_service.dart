import 'dart:convert';

import 'package:expenz_app/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  List<IncomeModel> incomeList = [];

  static const String _incomeKey = "income";

  Future<void> saveIncome(IncomeModel income, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? exsistingIncome = pref.getStringList(_incomeKey);

      //convert string list to Income objects

      List<IncomeModel> exsistingIncomeObjects = [];

      if (exsistingIncome != null) {
        exsistingIncomeObjects = exsistingIncome
            .map((e) => IncomeModel.fromJson(json.decode(e)))
            .toList();
      }

      exsistingIncomeObjects.add(income);

      List<String> updatedIncome = exsistingIncomeObjects
          .map(
            (e) => json.encode(e.toJson()),
          )
          .toList();

      await pref.setStringList(_incomeKey, updatedIncome);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Income added successfully"),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      print(e);
    }
  }

  Future<List<IncomeModel>> loadIncome() async {
    List<IncomeModel> loadedIcome = [];

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingIncome = pref.getStringList(_incomeKey);

      if (existingIncome != null) {
        loadedIcome = existingIncome
            .map(
              (e) => IncomeModel.fromJson(json.decode(e)),
            )
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return loadedIcome;
  }

  Future<void> deleteIncome(id, context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? exsistingIncome = pref.getStringList(_incomeKey);

      if (exsistingIncome != null) {
        List<IncomeModel> incomeObjects = exsistingIncome
            .map(
              (e) => IncomeModel.fromJson(json.decode(e)),
            )
            .toList();

        incomeObjects.removeWhere((item) => item.id == id);

        List<String> updatedList = incomeObjects
            .map(
              (e) => json.encode(e.toJson()),
            )
            .toList();

        await pref.setStringList(_incomeKey, updatedList);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Income deleted Sucsessfully"),
            duration: Duration(seconds: 2),
          ));
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
