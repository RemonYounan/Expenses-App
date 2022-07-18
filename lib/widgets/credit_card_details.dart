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
    List<Map<String, dynamic>> cardData = [
      {
        'title': 'Card Type',
        'value': type,
      },
      {
        'title': 'Cardholder name',
        'value': name,
      },
      {
        'title': 'Card number',
        'value': number,
      },
      {
        'title': 'PIN',
        'value': pin,
      },
      {
        'title': 'Expiration date',
        'value': expiryDate,
      },
      {
        'title': 'CVV',
        'value': cvv,
      },
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (_, i) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                cardData[i]['title'] as String,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: cardData[i]['value'] == 'Master Card'
                  ? Row(
                      children: [
                        Text(
                          cardData[i]['value'] as String,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18, color: Colors.grey),
                        ),
                        Image.asset(
                          'assets/master_card.png',
                          scale: 1.5,
                        )
                      ],
                    )
                  : Text(
                      cardData[i]['value'].toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18, color: Colors.grey),
                    ),
            ),
          ],
        );
      },
    );
  }
}
