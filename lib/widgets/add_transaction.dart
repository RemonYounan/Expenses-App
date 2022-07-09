import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  @override
  State<AddTransaction> createState() => _AddTransactionState();
  final Function(String title, double amount, DateTime date) _addTx;

  const AddTransaction(this._addTx, {Key? key}) : super(key: key);
}

class _AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();
  final icondropdown = '0';
  String? title;
  double? amount;
  var _pickedDate;

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget._addTx(title!, amount!, _pickedDate);
      print('added');
      Navigator.of(context).pop();
    }
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
    return Padding(
      padding: EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Icon :',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  key: const ValueKey('Title'),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Title';
                    }
                    return null;
                  },
                  onSaved: (value) => title = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  key: const ValueKey('Amount'),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Amount';
                    }
                    return null;
                  },
                  onSaved: (value) => amount = double.parse(value!),
                ),
              ),
              Row(
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
                    child: Text(
                      'Choose date',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _submitData,
                child: const Text(
                  'Add Transaction',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.only(
//             top: 8,
//             left: 8,
//             right: 8,
//             bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'Add New Transaction',
//                 softWrap: true,
//                 style: Theme.of(context).textTheme.headlineMedium,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Text(
//                 'Icon',
//                 textAlign: TextAlign.start,
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: TextField(
//                 key: const ValueKey('Title'),
//                 decoration: InputDecoration(
//                   labelText: 'Title',
//                   labelStyle: Theme.of(context).textTheme.titleMedium,
//                 ),
//                 controller: _titleControler,
//                 textInputAction: TextInputAction.next,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: TextField(
//                 key: const ValueKey('Title'),
//                 decoration: InputDecoration(
//                   labelText: 'Amount',
//                   labelStyle: Theme.of(context).textTheme.titleMedium,
//                 ),
//                 controller: _amountControler,
//                 keyboardType: TextInputType.number,
//                 textInputAction: TextInputAction.done,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               height: 70,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     _pickedDate == null
//                      //   ? 'No date choosen.'
//                         : 'Date: ${DateFormat.yMd().format(_pickedDate)}',
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                   TextButton(
//                     onPressed: _datePicker,
//                     child: const Text('Choose date'),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: ElevatedButton(
//                 onPressed: _submitData,
//                 child: const Text(
//                   'Add Transaction',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
