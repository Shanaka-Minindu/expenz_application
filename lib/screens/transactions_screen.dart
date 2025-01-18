import 'package:expenz_app/models/expence_model.dart';
import 'package:expenz_app/models/income_model.dart';

import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/expence_card.dart';
import 'package:expenz_app/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  final List<ExpenceModel> expensesList;
  final List<IncomeModel> incomeList;

  final void Function(ExpenceModel) onDismissedExpence;
  final void Function(IncomeModel) onDismissedIncome;

  const TransactionsScreen(
      {super.key,
      required this.expensesList,
      required this.incomeList,
      required this.onDismissedExpence,
      required this.onDismissedIncome});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "See your financial report",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: kMainColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Expenses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.32,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: kGrey.withOpacity(.05),
                  borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.expensesList.length,
                      itemBuilder: (context, index) {
                        final expens = widget.expensesList[index];

                        return Dismissible(
                          key: ValueKey(expens),
                          onDismissed: (direction) {
                            setState(() {
                              widget.onDismissedExpence(expens);
                            });
                          },
                          direction: DismissDirection.endToStart,
                          child: ExpenceCard(
                              title: expens.title,
                              discription: expens.discription,
                              category: expens.expence,
                              time: expens.time,
                              amount: expens.amount),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Income",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.32,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: kGrey.withOpacity(.05),
                  borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.incomeList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final item = widget.incomeList[index];
                    return Dismissible(
                      key: ValueKey(item),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          widget.onDismissedIncome(item);
                        });
                      },
                      child: IncomeCard(
                          title: item.title,
                          discription: item.discription,
                          category: item.catogory,
                          time: item.time,
                          amount: item.amount),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
