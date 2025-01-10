import 'package:expenz_app/screens/add_screen.dart';
import 'package:expenz_app/screens/bodget_screen.dart';
import 'package:expenz_app/screens/home_screen.dart';
import 'package:expenz_app/screens/profile_screen.dart';
import 'package:expenz_app/screens/transactions_screen.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),
      TransactionsScreen(),
      AddScreen(),
      BodgetScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kMainColor,
          backgroundColor: kWhite,
          unselectedItemColor: kGrey,
          currentIndex: _currentPageIndex,
          onTap: (value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_rounded),
              label: "Transactions",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: kMainColor, shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: kWhite,
                  size: 30,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rocket),
              label: "Bodget",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
      body: pages[_currentPageIndex],
    );
  }
}
