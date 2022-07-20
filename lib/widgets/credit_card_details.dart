import 'package:flutter/material.dart';

class CreditCardDetails extends StatefulWidget {
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
  State<CreditCardDetails> createState() => _CreditCardDetailsState();
}

class _CreditCardDetailsState extends State<CreditCardDetails> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardData = [
      {
        'title': 'Card Type',
        'value': widget.type,
      },
      {
        'title': 'Cardholder name',
        'value': widget.name,
      },
      {
        'title': 'Card number',
        'value': widget.number,
      },
      {
        'title': 'PIN',
        'value': widget.pin,
      },
      {
        'title': 'Expiration date',
        'value': widget.expiryDate,
      },
      {
        'title': 'CVV',
        'value': widget.cvv,
      },
    ];
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: cardData.map((e) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                e['title'] as String,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: e['value'] == 'Master Card'
                  ? Row(
                      children: [
                        Text(
                          e['value'] as String,
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
                      e['value'].toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18, color: Colors.grey),
                    ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
