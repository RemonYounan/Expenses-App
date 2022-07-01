import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static const routeName = '/notifications-screen';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var _readed = false;
  @override
  Widget build(BuildContext context) {
    // final notification = Provider.of<Notifications>(context); // can't get provider
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).primaryColor,
            elevation: 30,
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Getting started',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: _readed ? Colors.grey : Colors.white),
                  ),
                  Text(
                    'This application is about calculating your expenses and income and shows how much you saved in the month and year.',
                    style: TextStyle(
                      color: _readed ? Colors.grey : Colors.white,
                    ),
                    softWrap: true,
                  ),
                  !_readed
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _readed = !_readed;
                                });
                              },
                              child: const Text(
                                'Mark as read',
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
