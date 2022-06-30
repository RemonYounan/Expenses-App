import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  @override
  State<AddTransaction> createState() => _AddTransactionState();
  final Function(String title, double amount, DateTime date) _addTx;

  const AddTransaction(this._addTx, {Key? key}) : super(key: key);
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  var _pickedDate;

  void _submitData() {
    if (_amountControler.text.isEmpty) {
      return;
    }
    final title = _titleControler.text;
    final amount = double.parse(_amountControler.text);
    if (title.isEmpty || amount == 0 || _pickedDate == null) {
      return;
    }
    widget._addTx(title, amount, _pickedDate);
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        }
        setState(() {
          _pickedDate = value;
        });
      },
    );
    FocusNode().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Add New Transaction',
                softWrap: true,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                key: const ValueKey('Title'),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                ),
                controller: _titleControler,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                key: const ValueKey('Title'),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                ),
                controller: _amountControler,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _pickedDate == null
                        ? 'No date choosen.'
                        : 'Date: ${DateFormat.yMd().format(_pickedDate)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: _datePicker,
                    child: const Text('Choose date'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
