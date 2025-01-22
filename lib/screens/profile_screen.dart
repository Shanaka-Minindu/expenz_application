import 'package:expenz_app/screens/onboarding_screen.dart';
import 'package:expenz_app/services/expence_service.dart';
import 'package:expenz_app/services/income_service.dart';
import 'package:expenz_app/services/user_service.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/utils/constants.dart';
import 'package:expenz_app/widgets/in_expense_card.dart';
import 'package:expenz_app/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "";
  String email = "";
  @override
  void initState() {
    // TODO: implement initState

    UserServices.getUserdata().then(
      (value) {
        if (value != null) {
          userName = value["userName"]!;
          email = value["email"]!;
        }
      },
    );
    super.initState();
  }

  void _bottomMesssage(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          padding: EdgeInsets.all(kDefalutPadding),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kGrey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kMainColor)),
                      onPressed: () async {
                        await UserServices.eraseData();

                        if (context.mounted == true) {
                          await IncomeService().clearIncome(context);
                          await ExpenceService().clearExepnse(context);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnboardingScreen(),
                              ));
                        }
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: kWhite,
                        ),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kMainColor)),
                      onPressed: () => {Navigator.pop(context)},
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: kWhite,
                        ),
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$email",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Welcome $userName",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.edit,
                  color: const Color.fromARGB(255, 88, 88, 88),
                  size: 40,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            const ProfileCard(
              icon: Icons.wallet,
              title: "My Wallet",
              color: kMainColor,
            ),
            const ProfileCard(
              icon: Icons.settings,
              title: "Settings",
              color: kYellow,
            ),
            const ProfileCard(
              icon: Icons.download,
              title: "Export Data",
              color: kGreen,
            ),
            GestureDetector(
              onTap: () {
                _bottomMesssage(context);
              },
              child: const ProfileCard(
                icon: Icons.logout,
                title: "Log Out",
                color: kRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
