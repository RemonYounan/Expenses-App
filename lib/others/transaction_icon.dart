import 'package:flutter/material.dart';

class TransactionIcon {
  static Map<String, IconData> icons = {
    'Travel': Icons.flight,
    'Food': Icons.food_bank_outlined,
    'Health': Icons.health_and_safety_rounded,
    'Sports': Icons.directions_run_rounded,
    'Electricity': Icons.electrical_services_rounded,
    'Others': Icons.attach_money_rounded,
  };
  static IconData getIcon(String category) {
    return icons[category]!;
  }
}
