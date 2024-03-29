import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  @override
  State<AddTransaction> createState() => _AddTransactionState();

  const AddTransaction({Key? key}) : super(key: key);
}

class _AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();
  String category = 'Others';
  String? title;
  double? amount;
  DateTime? _pickedDate;

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<Transactions>(context, listen: false)
          .addTransaction(category, title!, amount!, _pickedDate!);
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
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
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
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.category_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Category :',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .2,
                  ),
                  SizedBox(
                    width: size.width * .4,
                    child: DropdownButtonFormField(
                      dropdownColor: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Travel',
                          child: Text('Travel'),
                        ),
                        DropdownMenuItem(
                          value: 'Food',
                          child: Text('Food'),
                        ),
                        DropdownMenuItem(
                          value: 'Health',
                          child: Text('Health'),
                        ),
                        DropdownMenuItem(
                          value: 'Sports',
                          child: Text('Sports'),
                        ),
                        DropdownMenuItem(
                          value: 'Electricity',
                          child: Text('Electricity'),
                        ),
                        DropdownMenuItem(
                          value: 'Others',
                          child: Text('Others'),
                        ),
                      ],
                      value: category,
                      onChanged: (String? value) => category = value!,
                      // onSaved: (String? value) => categorie = value!,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  key: const ValueKey('Title'),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.title_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Title',
                    labelStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                    errorStyle: const TextStyle(fontSize: 14),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid title';
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
                    icon: Icon(
                      Icons.local_atm_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Amount',
                    labelStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                    errorStyle: const TextStyle(fontSize: 14),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.date_range,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      _pickedDate == null
                          ? 'No date choosen'
                          : 'Date: ${DateFormat.yMd().format(_pickedDate!)}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: _datePicker,
                      child: Text(
                        'Choose date',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                            ),
                      ),
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
                child: Text(
                  'Add Transaction',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
