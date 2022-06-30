import 'package:flutter/material.dart';

class IncomeSources extends StatelessWidget {
  const IncomeSources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).cardColor,
    );
  }
}
