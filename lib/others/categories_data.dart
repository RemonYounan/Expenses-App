import 'package:flutter/material.dart';

List<Map<String, dynamic>> CATEGORIES_DATA = [
  {
    'title': 'Travel',
    'icon': Image.asset(
      'assets/images/flight.png',
      color: Colors.blue,
      height: 45,
    ),
    'color': Colors.amber,
  },
  {
    'title': 'Food',
    'icon': Image.asset(
      'assets/images/food.png',
      height: 45,
    ),
    'color': Colors.redAccent,
  },
  {
    'title': 'Health',
    'icon': Image.asset(
      'assets/images/health.png',
      height: 45,
    ),
    'color': Colors.blueAccent,
  },
  {
    'title': 'Sports',
    'icon': Image.asset(
      'assets/images/sports.png',
      height: 45,
    ),
    'color': Colors.blue,
  },
  {
    'title': 'Electricity',
    'icon': Image.asset(
      'assets/images/plug.png',
      height: 45,
      color: Colors.white60,
    ),
    'color': Colors.amber,
  },
  {
    'title': 'Others',
    'icon': Image.asset(
      'assets/images/coffee.png',
      height: 45,
      color: Colors.blue,
    ),
    'color': Colors.orange,
  },
];
