import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/add_credit_screen.dart';
import 'package:personal_expenses/screens/balance_screen.dart';
import 'package:personal_expenses/screens/profile_screen.dart';
import 'package:personal_expenses/screens/home_screen.dart';
import 'package:personal_expenses/screens/statistics_screen.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/Main-screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    _pages = [
      HomeScreen(),
      BalanceScreen(),
      StatisticsScreen(),
      ProfileScreen(),
    ];


    void _addNewTransaction() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (_) {
          return AddTransaction();
        },
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          activeColor: Theme.of(context).colorScheme.secondary,
          inactiveColor: Colors.white54,
          borderColor: Theme.of(context).cardColor,
          backgroundGradient: LinearGradient(colors: [
            Theme.of(context).cardColor,
            Theme.of(context).cardColor,
          ]),
          // gapWidth: 50,
          notchSmoothness: NotchSmoothness.smoothEdge,
          hideAnimationCurve: Curves.easeIn,
          rightCornerRadius: 0,
          blurEffect: true,
          notchMargin: 10,
          gapLocation: GapLocation.end,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          activeIndex: _selectedIndex,
          iconSize: 30,
          icons: [
            Icons.home_filled,
            Icons.account_balance_wallet_outlined,
            Icons.stacked_bar_chart,
            Icons.person
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedIndex == 3
            ? () {
                Navigator.pushNamed(context, AddCreditScreen.routeName);
              }
            : _addNewTransaction,
        child: Icon(_selectedIndex == 3 ? Icons.credit_card : Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
