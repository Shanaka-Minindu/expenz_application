import 'package:expenz_app/models/expence_model.dart';
import 'package:expenz_app/models/income_model.dart';
import 'package:expenz_app/services/user_service.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/expence_card.dart';
import 'package:expenz_app/widgets/in_expense_card.dart';
import 'package:expenz_app/widgets/line_cart_sample.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<ExpenceModel> expenseList;
  final List<IncomeModel> incomeList;
  const HomeScreen(
      {super.key, required this.expenseList, required this.incomeList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "";
  double income = 0;
  double expence = 0;

  @override
  void initState() {
    // TODO: implement initState
    UserServices.getUserdata().then(
      (value) {
        if (value["userName"] != null) {
          setState(() {
            username = value["userName"]!;
          });
        }
      },
    );

    setState(() {
      for (int i = 0; i < widget.expenseList.length; i++) {
        expence = expence + widget.expenseList[i].amount;
      }
      for (int k = 0; k < widget.incomeList.length; k++) {
        income = income + widget.incomeList[k].amount;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kMainColor, width: 3),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/user.jpg"))),
                          ),
                          Text(
                            "Welcome $username",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.notifications,
                            color: kMainColor,
                            size: 40,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InExpenseCard(
                              title: "Income",
                              amount: income,
                              bgColor: kGreen,
                              imgUrl: "assets/images/income.png"),
                          InExpenseCard(
                              title: "Expence",
                              amount: expence,
                              bgColor: kRed,
                              imgUrl: "assets/images/expense.png"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Spend Frequency",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LineCartSample(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Recent Transaction",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .3,
                      padding: EdgeInsets.symmetric(vertical: 05),
                      decoration: BoxDecoration(
                          color: kGrey.withOpacity(.05),
                          borderRadius: BorderRadius.circular(20)),
                      child: widget.expenseList.isEmpty
                          ? Center(
                              child: Text(
                                "Expense list is Empty. \nAdd your Expense to \npress + icon.",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kGrey.withOpacity(.5)),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.expenseList.length,
                              itemBuilder: (context, index) {
                                final expence = widget.expenseList[index];
                                return ExpenceCard(
                                    title: expence.title,
                                    discription: expence.discription,
                                    category: expence.expence,
                                    time: expence.time,
                                    amount: expence.amount);
                              },
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
