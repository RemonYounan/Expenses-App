import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/models/notification.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/screens/add_credit_screen.dart';
import 'package:personal_expenses/screens/home_screen.dart';
import 'package:personal_expenses/screens/main_screen.dart';
import 'package:personal_expenses/screens/notifications_screen.dart';
import 'package:personal_expenses/screens/statistics_screen.dart';
import 'package:personal_expenses/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.showHome, Key? key}) : super(key: key);
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
        ChangeNotifierProvider(
          create: (_) => Notifications(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Personal Expenses',
        theme: ThemeData(
          cardColor: const Color.fromARGB(255, 14, 7, 17),
          cardTheme: CardTheme(
            color: const Color.fromARGB(255, 14, 7, 17),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            titleSmall: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          fontFamily: 'Objectivity',
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber,
          ),
          primaryColor: const Color.fromARGB(255, 42, 28, 46),
        ),
        home: showHome ? const MainScreen() : WelcomeScreen(),
        routes: {
          MainScreen.routeName: (context) => const MainScreen(),
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
