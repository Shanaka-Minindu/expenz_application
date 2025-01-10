import 'package:expenz_app/services/user_service.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/in_expense_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "";

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
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
                                image: AssetImage("assets/images/user.jpg"))),
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
                          amount: 5000,
                          bgColor: kGreen,
                          imgUrl: "assets/images/income.png"),
                      InExpenseCard(
                          title: "Expence",
                          amount: 1200,
                          bgColor: kRed,
                          imgUrl: "assets/images/expense.png"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
