import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/widgets/credit_card_details.dart';

class CreditItem extends StatefulWidget {
  CreditItem(this.i, this.credits, {Key? key}) : super(key: key);
  final int i;
  final CreditCards credits;

  @override
  State<CreditItem> createState() => _CreditItemState();
}

class _CreditItemState extends State<CreditItem> {
  var _expand = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Credit ${widget.i + 1}:',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18),
              ),
              IconButton(
                splashRadius: 15,
                onPressed: () {
                  setState(() {
                    _expand = !_expand;
                  });
                },
                icon: _expand
                    ? const Icon(Icons.expand_less_rounded)
                    : const Icon(Icons.expand_more_rounded),
                color: Colors.white,
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          height: _expand ? size.height * .4 : 0,
          child: CreditCardDetails(
            type: widget.credits.creditCards[widget.i].type!,
            name: widget.credits.creditCards[widget.i].name!,
            number: widget.credits.creditCards[widget.i].number!,
            pin: widget.credits.creditCards[widget.i].pin!,
            expiryDate: widget.credits.creditCards[widget.i].expiryDate!,
            cvv: widget.credits.creditCards[widget.i].cvv!,
          ),
        ),
      ],
    );
  }
}
