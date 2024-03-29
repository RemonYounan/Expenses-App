import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileSlider extends StatefulWidget {
  const ProfileSlider({Key? key}) : super(key: key);

  @override
  State<ProfileSlider> createState() => _ProfileSliderState();
}

class _ProfileSliderState extends State<ProfileSlider> {
  double _value = 100;
  final int _cardBalance = 4000;
  NumberFormat numFormat = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * .6,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card balance',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      '\$${numFormat.format(_cardBalance)}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22,
                          ),
                    ),
                  ),
                  Text(
                    'Monthly limit',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      '\$${numFormat.format(_value)}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackShape: const RoundedRectSliderTrackShape(),
                activeTrackColor: Theme.of(context).colorScheme.secondary,
                activeTickMarkColor: Theme.of(context).colorScheme.secondary,
                inactiveTrackColor: Theme.of(context).cardColor,
                inactiveTickMarkColor: Theme.of(context).cardColor,
                thumbColor: Theme.of(context).colorScheme.secondary,
                thumbShape: const RoundSliderThumbShape(),
              ),
              child: Slider(
                value: _value,
                divisions: _cardBalance ~/ 100,
                max: _cardBalance.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
