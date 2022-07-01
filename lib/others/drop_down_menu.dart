import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get monthDropdownItems {
  List<DropdownMenuItem<String>> monthMenuItems = [];
  for (var i = 1; i < 13; i++) {
    monthMenuItems.add(DropdownMenuItem(
      child: Text('$i'),
      value: '$i',
    ));
  }
  return monthMenuItems;
}

List<DropdownMenuItem<String>> get yearDropdownItems {
  List<DropdownMenuItem<String>> yearMenuItems = [];
  for (var i = 22; i < 50; i++) {
    yearMenuItems.add(DropdownMenuItem(
      child: Text('$i'),
      value: '$i',
    ));
  }
  return yearMenuItems;
}
