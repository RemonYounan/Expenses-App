import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get monthDropdownItems {
  final List<DropdownMenuItem<String>> monthMenuItems = [];
  for (var i = 1; i < 13; i++) {
    monthMenuItems.add(
      DropdownMenuItem(
        value: '$i',
        child: Text('$i'),
      ),
    );
  }
  return monthMenuItems;
}

List<DropdownMenuItem<String>> get yearDropdownItems {
  final List<DropdownMenuItem<String>> yearMenuItems = [];
  for (var i = 22; i < 50; i++) {
    yearMenuItems.add(
      DropdownMenuItem(
        value: '$i',
        child: Text('$i'),
      ),
    );
  }
  return yearMenuItems;
}
