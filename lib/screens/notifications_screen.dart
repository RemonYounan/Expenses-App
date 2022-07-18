import 'package:flutter/material.dart';
import 'package:personal_expenses/models/notification.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = '/notifications-screen';
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Consumer<Notifications>(
          builder: (_, notifications, ch) => ListView.builder(
            itemCount: notifications.notifications.length,
            itemBuilder: (_, i) => Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Theme.of(context).cardColor,
              elevation: 30,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        notifications.notifications[i].title,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: notifications.notifications[i].readed
                                  ? Colors.grey
                                  : Colors.white,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        notifications.notifications[i].body,
                        style: TextStyle(
                          color: notifications.notifications[i].readed
                              ? Colors.grey
                              : Colors.white,
                        ),
                        softWrap: true,
                      ),
                    ),
                    if (!notifications.notifications[i].readed)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                notifications.markAsReaded(
                                  notifications.notifications[i].id,
                                );
                              });
                            },
                            child: const Text(
                              'Mark as read',
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
