import 'package:flutter/cupertino.dart';

class Notification {
  String id;
  String title;
  String body;
  bool readed;

  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.readed,
  });
}

class Notifications with ChangeNotifier {
  final List<Notification> _notifications = [
    Notification(
      id: DateTime.now().toString(),
      title: 'Getting started',
      body:
          'This application is about calculating your expenses and income and shows how much you saved in the month and year.',
      readed: false,
    ),
  ];

  List<Notification> get notifications {
    return _notifications;
  }

  void markAsReaded(String id) {
    final notification =
        _notifications.firstWhere((element) => element.id == id);
    notification.readed = true;
  }
}
