import 'package:expenz_app/models/expence_model.dart';
import 'package:expenz_app/models/income_model.dart';
import 'package:expenz_app/screens/add_screen.dart';
import 'package:expenz_app/screens/bodget_screen.dart';
import 'package:expenz_app/screens/home_screen.dart';
import 'package:expenz_app/screens/profile_screen.dart';
import 'package:expenz_app/screens/transactions_screen.dart';
import 'package:expenz_app/services/expence_service.dart';
import 'package:expenz_app/services/income_service.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 4;
  double totIncome = 0;
  double totExpense = 0;
  List<ExpenceModel> expensesList = [];
  List<IncomeModel> incomeList = [];

  void fetchAllExpenses() async {
    List<ExpenceModel> loadedExpenses = await ExpenceService().loadExpenses();

    setState(() {
      expensesList = loadedExpenses;
    });
    print("Mamaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(loadedExpenses.length);
  }

  void addExpeces(ExpenceModel newExpence) {
    ExpenceService().saveExpence(newExpence, context);
    setState(() {
      expensesList.add(newExpence);
    });
  }

  void removeExpence(ExpenceModel expence) {
    ExpenceService().daleteExpences(expence.id, context);

    setState(() {
      expensesList.remove(expence);
    });
  }

  void fetchAllIncome() async {
    List<IncomeModel> allIncome = await IncomeService().loadIncome();
    setState(() {
      incomeList = allIncome;
    });
    print("Incomeeeeeeeeeeeeeeeeeeeeeeeee");
    print(allIncome.length);
  }

  void addIncome(IncomeModel income) {
    IncomeService().saveIncome(income, context);
    setState(() {
      incomeList.add(income);
    });
  }

  void deleteIncome(IncomeModel income) {
    IncomeService().deleteIncome(income.id, context);
    setState(() {
      incomeList.remove(income);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllExpenses();
    fetchAllIncome();
  }

  Map<Expence, double> calculateExpenseCatogory() {
    Map<Expence, double> catogoryTotals = {
      Expence.food: 0,
      Expence.health: 0,
      Expence.shopping: 0,
      Expence.subscription: 0,
      Expence.transport: 0
    };
    totExpense = 0;
    for (ExpenceModel expence in expensesList) {
      catogoryTotals[expence.expence] =
          catogoryTotals[expence.expence]! + expence.amount;

      totExpense = totExpense + expence.amount;
    }

    return catogoryTotals;
  }

  Map<Income, double> calculateIncomeCatogory() {
    Map<Income, double> catogoryTotals = {
      Income.freelance: 0,
      Income.passiveIncome: 0,
      Income.salary: 0,
      Income.sales: 0
    };
    totIncome = 0;

    for (IncomeModel income in incomeList) {
      catogoryTotals[income.catogory] =
          catogoryTotals[income.catogory]! + income.amount;
      totIncome = totIncome + income.amount;
    }
    return catogoryTotals;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(
        expenseList: expensesList,
        incomeList: incomeList,
      ),
      TransactionsScreen(
        expensesList: expensesList,
        incomeList: incomeList,
        onDismissedExpence: removeExpence,
        onDismissedIncome: deleteIncome,
      ),
      AddScreen(
        addExpense: addExpeces,
        addIncome: addIncome,
      ),
      BodgetScreen(
        // expenseList: expensesList,
        // incomeList: incomeList,
        expenseCatogoryTotals: calculateExpenseCatogory(),
        incomeCatogoryTotals: calculateIncomeCatogory(),
        expTotal: totExpense,
        incTotal: totIncome,
      ),
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
