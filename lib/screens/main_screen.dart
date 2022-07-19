import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/add_credit_screen.dart';
import 'package:personal_expenses/screens/balance_screen.dart';
import 'package:personal_expenses/screens/home_screen.dart';
import 'package:personal_expenses/screens/profile_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    _pages = [
      HomeScreen(),
      const BalanceScreen(),
      StatisticsScreen(),
      const ProfileScreen(),
    ];

    void _addNewTransaction() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (_) {
          return const AddTransaction();
        },
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Theme.of(context).colorScheme.secondary,
        inactiveColor: Colors.white54,
        borderColor: Theme.of(context).primaryColor,
        backgroundGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).cardColor,
            // Colors.black,
            Theme.of(context).cardColor,
          ],
        ),
        // gapWidth: 50,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        hideAnimationCurve: Curves.easeIn,
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
        icons: const [
          Icons.home_outlined,
          Icons.account_balance_wallet_outlined,
          Icons.stacked_bar_chart_rounded,
          Icons.person_outline_rounded,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedIndex == 3
            ? () {
                Navigator.pushNamed(context, AddCreditScreen.routeName);
              }
            : _addNewTransaction,
        // backgroundColor: const Color.fromARGB(255, 213, 50, 142),
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 226, 28, 222),
                Color.fromARGB(255, 213, 50, 142),
                Color.fromARGB(255, 203, 44, 85),
              ],
            ),
          ),
          child: Icon(
            _selectedIndex == 3 ? Icons.credit_card : Icons.add,
            size: 45,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
