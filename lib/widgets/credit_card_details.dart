import 'package:flutter/material.dart';
import 'package:personal_expenses/others/card_data.dart';

class CreditCardDetails extends StatelessWidget {
  CreditCardDetails({
    required this.type,
    required this.name,
    required this.number,
    required this.pin,
    required this.expiryDate,
    required this.cvv,
    Key? key,
  }) : super(key: key);
  String type;
  String name;
  int number;
  int pin;
  String expiryDate;
  int cvv;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (_, i) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  CardInfo.cardLabels[i],
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  CardInfo()
                      .CardData(i, type, name, number, pin, expiryDate, cvv),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18, color: Colors.grey),
                ),
              ),
            ],
          );
        });
  }
}
