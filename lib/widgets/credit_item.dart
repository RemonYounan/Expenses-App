import 'package:flutter/material.dart';
import 'package:personal_expenses/models/credit_card.dart';
import 'package:personal_expenses/widgets/credit_card_details.dart';

class CreditItem extends StatefulWidget {
  const CreditItem(this.credit, this.index, {Key? key}) : super(key: key);
  final CreditCard credit;
  final int index;
  @override
  State<CreditItem> createState() => _CreditItemState();
}

class _CreditItemState extends State<CreditItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CreditCardDetails(
            type: widget.credit.type!,
            name: widget.credit.name!,
            number: widget.credit.number!,
            pin: widget.credit.pin!,
            expiryDate: widget.credit.expiryDate!,
            cvv: widget.credit.cvv!,
          ),
        ],
      ),
    );
  }
}
