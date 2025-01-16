import 'dart:ffi';

import 'package:expenz_app/models/expence_model.dart';
import 'package:expenz_app/models/income_model.dart';
import 'package:expenz_app/services/expence_service.dart';
import 'package:expenz_app/services/income_service.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/coustom_button.dart';
import 'package:expenz_app/widgets/date_button.dart';
import 'package:expenz_app/widgets/time_button.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  final Function(ExpenceModel) addExpense;
  final Function(IncomeModel) addIncome;

  const AddScreen(
      {super.key, required this.addExpense, required this.addIncome});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool _expensePage = true;
  Expence _expence = Expence.health;
  Income _income = Income.salary;

  //Text Editing Controller
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _discriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  // date time
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _discriptionController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _expensePage ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: 59,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(60)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _expensePage = true;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .385,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: _expensePage ? kMainColor : kWhite,
                                    borderRadius: BorderRadius.circular(60)),
                                child: Center(
                                  child: Text(
                                    "Expense",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: _expensePage ? kWhite : kBlack),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _expensePage = false;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .385,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: _expensePage ? kWhite : kMainColor,
                                    borderRadius: BorderRadius.circular(60)),
                                child: Center(
                                  child: Text(
                                    "Income",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: _expensePage
                                            ? const Color.fromARGB(255, 0, 0, 0)
                                            : kWhite),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How much?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: kWhite.withOpacity(.5)),
                    ),
                    TextField(
                      style: TextStyle(
                          fontSize: 66,
                          fontWeight: FontWeight.w600,
                          color: kWhite),
                      decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: kWhite),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * .6,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .3,
                ),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Form(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 20, top: 16, bottom: 16, right: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        items: _expensePage
                            ? Expence.values.map(
                                (category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                },
                              ).toList()
                            : Income.values.map(
                                (category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                },
                              ).toList(),
                        value: _expensePage ? _expence : _income,
                        onChanged: (value) {
                          setState(() {
                            _expensePage
                                ? _expence = value as Expence
                                : _income = value as Income;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 16, bottom: 16),
                            hintText: "Title",
                            hintStyle: TextStyle(color: kGrey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _discriptionController,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 16, bottom: 16),
                            hintText: "Description",
                            hintStyle: TextStyle(color: kGrey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 16, bottom: 16),
                            hintText: "Amount",
                            hintStyle: TextStyle(color: kGrey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2024),
                                      lastDate: DateTime(2026))
                                  .then(
                                (value) {
                                  if (value != null) {
                                    setState(() {
                                      _date = value;
                                    });
                                  }
                                },
                              );
                            },
                            child: DateButton(),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(_date),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 95, 95, 95),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then(
                                (value) {
                                  setState(() {
                                    if (value != null) {
                                      _time = DateTime(_date.year, _date.month,
                                          _date.day, value.hour, value.minute);
                                    }
                                  });
                                },
                              );
                            },
                            child: TimeButton(),
                          ),
                          Text(DateFormat.jm().format(_time))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: kGrey,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_expensePage) {
                            List<ExpenceModel> loadedExpences =
                                await ExpenceService().loadExpenses();
                            print(loadedExpences.length);

                            ExpenceModel expense = ExpenceModel(
                                id: loadedExpences.length + 1,
                                title: _titleController.text,
                                discription: _discriptionController.text,
                                amount: _amountController.text == Null
                                    ? 0
                                    : double.parse(_amountController.text),
                                date: _date,
                                time: _time,
                                expence: _expence);

                            widget.addExpense(expense);
                          } else {
                            List<IncomeModel> loadedIncome =
                                await IncomeService().loadIncome();
                            IncomeModel income = IncomeModel(
                                id: loadedIncome.length + 1,
                                title: _titleController.text,
                                discription: _discriptionController.text,
                                amount: _amountController == null
                                    ? 0
                                    : double.parse(_amountController.text),
                                date: _date,
                                time: _time,
                                catogory: _income);

                            widget.addIncome(income);
                          }
                        },
                        child: CoustomButton(
                            butText: "Add",
                            color: _expensePage ? kRed : kGreen,
                            textColor: kWhite),
                      )
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
