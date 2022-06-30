import 'package:flutter/material.dart';
import 'package:personal_expenses/models/credit_card.dart';
import 'package:personal_expenses/widgets/credit_card_details.dart';

class CreditItem extends StatefulWidget {
  CreditItem(this.credit, this.index, {Key? key}) : super(key: key);
  final CreditCard credit;
  final int index;
  @override
  State<CreditItem> createState() => _CreditItemState();
}

class _CreditItemState extends State<CreditItem> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    'Card ${widget.index + 1}:',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () => setState(() {
                      _isExpanded = !_isExpanded;
                    }),
                    icon: _isExpanded
                        ? Icon(Icons.expand_less)
                        : Icon(Icons.expand_more_rounded),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeIn,
            height: _isExpanded ? 260 : 0,
            duration: Duration(milliseconds: 300),
            child: CreditCardDetails(
              type: widget.credit.type!,
              name: widget.credit.name!,
              number: widget.credit.number!,
              pin: widget.credit.pin!,
              expiryDate: widget.credit.expiryDate!,
              cvv: widget.credit.cvv!,
            ),
          ),
        ],
      ),
    );
  }
}
