import 'package:flutter/cupertino.dart';

class Notification {
  String? id;
  String? title;
  String? body;

  Notification(
    this.id,
    this.title,
    this.body,
  );
}

class Notifications with ChangeNotifier {
  final List<Notification> _notifications = [
    Notification(
      DateTime.now().toString(),
      'Getting started',
      'This application is about calculating your expenses and income and shows how much you saved in the month and year.',
    ),
  ];

  List<Notification> get notifications {
    return _notifications;
  }
}
