import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/screens/add_credit_screen.dart';
import 'package:personal_expenses/screens/home_screen.dart';
import 'package:personal_expenses/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './providers/transactions.dart';
import 'package:personal_expenses/screens/main_screen.dart';
import 'package:personal_expenses/screens/notifications_screen.dart';
import 'package:personal_expenses/screens/statistics_screen.dart';
import 'screens/statistics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome));
}

class MyApp extends StatelessWidget {
  MyApp(this.showHome, {Key? key}) : super(key: key);
  bool showHome;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Transactions(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreditCards(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Personal Expenses',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          cardColor: Color.fromARGB(255, 33, 21, 36),
          cardTheme: CardTheme(
            color: Color.fromARGB(255, 33, 21, 36),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
            titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              color: Colors.white,
            ),
          ),
          fontFamily: 'SourceSansPro',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            accentColor: Colors.amber,
          ),
          primaryColor: Color.fromARGB(255, 57, 39, 63),
        ),
        home: showHome ? MainScreen() : WelcomeScreen(),
        routes: {
          MainScreen.routeName: (context) => MainScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          StatisticsScreen.routeName: (context) => StatisticsScreen(),
          AddCreditScreen.routeName: (context) => AddCreditScreen(false),
          NotificationsScreen.routeName: (context) =>
              const NotificationsScreen(),
        },
      ),
    );
  }
}
