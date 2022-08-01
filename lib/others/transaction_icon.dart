import 'package:flutter/material.dart';

class TransactionIcon {
  static Map<String, Image> icons = {
    'Travel': Image.asset(
      'assets/images/flight.png',
      color: Colors.blue,
      height: 40,
    ),
    'Food': Image.asset(
      'assets/images/food.png',
      height: 40,
    ),
    'Health': Image.asset(
      'assets/images/health.png',
      height: 40,
    ),
    'Sports': Image.asset(
      'assets/images/sports.png',
      height: 40,
    ),
    'Electricity': Image.asset(
      'assets/images/plug.png',
      height: 40,
      color: Colors.white60,
    ),
    'Others': Image.asset(
      'assets/images/coffee.png',
      height: 40,
      color: Colors.blue,
    ),
  };
  static Image getIcon(String category) {
    return icons[category]!;
  }
}
