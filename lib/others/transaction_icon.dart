import 'package:flutter/material.dart';

class TransactionIcon {
  static Map<String, Image> icons = {
    'Travel': Image.asset(
      'assets/flight.png',
      color: Colors.blue,
      height: 40,
    ),
    'Food': Image.asset(
      'assets/food.png',
      height: 40,
    ),
    'Health': Image.asset(
      'assets/health.png',
      height: 40,
    ),
    'Sports': Image.asset(
      'assets/sports.png',
      height: 40,
    ),
    'Electricity': Image.asset(
      'assets/plug.png',
      height: 40,
      color: Colors.white60,
    ),
    'Others': Image.asset(
      'assets/coffee.png',
      height: 40,
      color: Colors.blue,
    ),
  };
  static Image getIcon(String category) {
    return icons[category]!;
  }
}
