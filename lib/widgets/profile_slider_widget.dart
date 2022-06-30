import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileSlider extends StatefulWidget {
  ProfileSlider({Key? key}) : super(key: key);

  @override
  State<ProfileSlider> createState() => _ProfileSliderState();
}

class _ProfileSliderState extends State<ProfileSlider> {
  double _value = 100;
  final int _cardBalance = 4000;
  NumberFormat numFormat = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Profile',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 28, fontWeight: FontWeight.w900),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Card balance',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 22, color: Colors.grey),
          ),
        ),
        Text(
          '\$${numFormat.format(_cardBalance)}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Monthly limit',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 22,
                  color: Colors.grey,
                ),
          ),
        ),
        Text(
          '\$${numFormat.format(_value)}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackShape: RoundedRectSliderTrackShape(),
            activeTrackColor: Theme.of(context).colorScheme.secondary,
            activeTickMarkColor: Theme.of(context).colorScheme.secondary,
            inactiveTrackColor: Theme.of(context).cardColor,
            inactiveTickMarkColor: Theme.of(context).cardColor,
            thumbColor: Theme.of(context).colorScheme.secondary,
            thumbShape: RoundSliderThumbShape(),
          ),
          child: Slider(
            value: _value,
            divisions: (_cardBalance ~/ 100).toInt(),
            max: _cardBalance.toDouble(),
            onChanged: (value) {
              setState(() {
                _value = value.toDouble();
              });
            },
          ),
        ),
      ],
    );
  }
}
