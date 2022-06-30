import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
        ],
      ),
    );
  }
}
