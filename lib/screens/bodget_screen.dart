import 'package:expenz_app/models/expence_model.dart';
import 'package:expenz_app/models/income_model.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/chart.dart';

import 'package:expenz_app/widgets/expense_proggrass_bar.dart';
import 'package:expenz_app/widgets/income_proggrass_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BodgetScreen extends StatefulWidget {
  // final List<ExpenceModel> expenseList;
  // final List<IncomeModel> incomeList;

  final Map<Expence, double> expenseCatogoryTotals;
  final Map<Income, double> incomeCatogoryTotals;
  final double expTotal;
  final double incTotal;
  const BodgetScreen({
    super.key,
    required this.expenseCatogoryTotals,
    required this.incomeCatogoryTotals,
    required this.expTotal,
    required this.incTotal,
  });

  @override
  State<BodgetScreen> createState() => _BodgetScreenState();
}

class _BodgetScreenState extends State<BodgetScreen> {
  bool isExpensTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Financial Report",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 59,
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(60)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpensTab = true;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .385,
                          height: 54,
                          decoration: BoxDecoration(
                              color: isExpensTab ? kMainColor : kWhite,
                              borderRadius: BorderRadius.circular(60)),
                          child: Center(
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isExpensTab ? kWhite : kBlack),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpensTab = false;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .385,
                          height: 54,
                          decoration: BoxDecoration(
                              color: isExpensTab ? kWhite : kMainColor,
                              borderRadius: BorderRadius.circular(60)),
                          child: Center(
                            child: Text(
                              "Income",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isExpensTab
                                      ? const Color.fromARGB(255, 0, 0, 0)
                                      : kWhite),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Chart(
                    expenseCatogoryTotal: widget.expenseCatogoryTotals,
                    incomeCatogryTotal: widget.incomeCatogoryTotals,
                    expTotal: widget.expTotal,
                    incTotal: widget.incTotal,
                    isExpense: isExpensTab),
                SizedBox(
                  height: 50,
                ),
                isExpensTab
                    ? Column(
                        children: [
                          ProggrassBar(
                              color: kMainColor,
                              title: "Shopping",
                              amount: widget.expenseCatogoryTotals.values
                                  .toList()[2],
                              total: widget.expTotal),
                          ProggrassBar(
                              color: const Color.fromARGB(255, 255, 0, 0),
                              title: "Food",
                              amount: widget.expenseCatogoryTotals.values
                                  .toList()[0],
                              total: widget.expTotal),
                          ProggrassBar(
                              color: const Color.fromARGB(255, 0, 51, 255),
                              title: "Transport",
                              amount: widget.expenseCatogoryTotals.values
                                  .toList()[4],
                              total: widget.expTotal),
                          ProggrassBar(
                              color: const Color.fromARGB(255, 0, 255, 21),
                              title: "Health",
                              amount: widget.expenseCatogoryTotals.values
                                  .toList()[1],
                              total: widget.expTotal),
                          ProggrassBar(
                              color: const Color.fromARGB(255, 238, 0, 255),
                              title: "Subscription",
                              amount: widget.expenseCatogoryTotals.values
                                  .toList()[3],
                              total: widget.expTotal),
                        ],
                      )
                    : Column(
                        children: [
                          IncomeProggrassBar(
                              color: const Color.fromARGB(255, 0, 215, 93),
                              title: "Freelance",
                              amount: widget.incomeCatogoryTotals.values
                                  .toList()[0],
                              total: widget.incTotal),
                          IncomeProggrassBar(
                              color: const Color.fromARGB(255, 215, 0, 122),
                              title: "Salary",
                              amount: widget.incomeCatogoryTotals.values
                                  .toList()[2],
                              total: widget.incTotal),
                          IncomeProggrassBar(
                              color: const Color.fromARGB(255, 230, 192, 0),
                              title: "PassiveIncome",
                              amount: widget.incomeCatogoryTotals.values
                                  .toList()[1],
                              total: widget.incTotal),
                          IncomeProggrassBar(
                              color: const Color.fromARGB(255, 215, 0, 208),
                              title: "Sales",
                              amount: widget.incomeCatogoryTotals.values
                                  .toList()[3],
                              total: widget.incTotal),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
