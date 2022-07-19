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
  var _expand = false;
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
    final screenHigh = MediaQuery.of(context).size.height;

    return Card(
      color: Theme.of(context).cardColor,
      elevation: 0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'credit ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _expand = !_expand;
                  });
                },
                icon: _expand
                    ? const Icon(
                        Icons.expand_less,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.expand_more,
                        color: Colors.white,
                      ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _expand ? screenHigh * .45 : 0,
            child: Card(
              child: ListView.builder(
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
                                        .copyWith(
                                            fontSize: 18, color: Colors.grey),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
