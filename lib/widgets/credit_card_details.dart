import 'package:flutter/material.dart';

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
          late String title;
          if (i == 0) {
            title = 'Card Type';
          } else if (i == 1) {
            title = 'Cardholder Name';
          } else if (i == 2) {
            title = 'Card Number';
          } else if (i == 3) {
            title = 'PIN';
          } else if (i == 4) {
            title = 'Expiry Date';
          } else if (i == 5) {
            title = 'CVV';
          }
          var value;
          if (i == 0) {
            value = type;
          } else if (i == 1) {
            value = name;
          } else if (i == 2) {
            value = number.toString();
          } else if (i == 3) {
            value = pin.toString();
          } else if (i == 4) {
            value = expiryDate;
          } else if (i == 5) {
            value = cvv.toString();
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  value,
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
