import 'package:flutter/material.dart';

class CategoriGridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  CategoriGridItem(this.title, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Card(
          elevation: 20,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 50,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '-\$40',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
