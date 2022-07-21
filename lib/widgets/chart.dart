import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

class TxChart extends StatelessWidget {
  const TxChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chart(
      layers: [
        ChartAxisLayer(
          labelX: (value) => value.toInt().toString(),
          labelY: (value) => value.toInt().toString(),
          settings: ChartAxisSettings(
            x: ChartAxisSettingsAxis(
              frequency: 7,
              min: 0,
              max: 7,
              textStyle: Theme.of(context).textTheme.titleMedium!,
            ),
            y: ChartAxisSettingsAxis(
              frequency: 7,
              min: 0,
              max: 7,
              textStyle: Theme.of(context).textTheme.titleMedium!,
            ),
          ),
        )
      ],
    );
  }
}
