import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/widgets/custom_form_filed.dart';
import 'package:provider/provider.dart';

class AddCreditScreen extends StatefulWidget {
  AddCreditScreen({Key? key}) : super(key: key);
  static const routeName = '/add-credit-screen';

  @override
  State<AddCreditScreen> createState() => _AddCreditScreenState();
}

class _AddCreditScreenState extends State<AddCreditScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  int? number;
  int? exMonth;
  int? exYear;
  int? pin;
  int? cvv;

  void _Submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final credit = Provider.of<CreditCards>(context, listen: false);
      final _expiryDate = '$exMonth/$exYear';
      credit.AddCreditCard(
        'Master Card',
        name,
        number,
        pin,
        _expiryDate,
        cvv,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_rounded),
                      color: Colors.white,
                      iconSize: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Add Credit Card',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 26,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                CustomFormField(
                  'User Name',
                  Icons.text_fields_rounded,
                  TextInputType.name,
                  TextInputAction.next,
                  false,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid username';
                    }
                  },
                  (value) => name = value,
                ),
                CustomFormField(
                  'Credit Number',
                  Icons.numbers,
                  TextInputType.number,
                  TextInputAction.next,
                  false,
                  (value) {
                    if (value!.length != 16 || value.isEmpty) {
                      return 'Enter a valid credit number';
                    }
                  },
                  (value) => number = int.parse(value!),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomFormField(
                        'Expiry Month',
                        Icons.date_range,
                        TextInputType.datetime,
                        TextInputAction.next,
                        false,
                        (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid month';
                          }
                        },
                        (value) => exMonth = int.parse(value!),
                      ),
                    ),
                    Expanded(
                      child: CustomFormField(
                        'Expiry Year',
                        Icons.date_range,
                        TextInputType.datetime,
                        TextInputAction.next,
                        false,
                        (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid year';
                          }
                        },
                        (value) => exYear = int.parse(value!),
                      ),
                    ),
                  ],
                ),
                CustomFormField(
                  'PIN',
                  Icons.password_rounded,
                  TextInputType.number,
                  TextInputAction.next,
                  true,
                  (value) {
                    if (value!.length != 4) {
                      return 'Enter a valid PIN';
                    }
                  },
                  (value) => pin = int.parse(value!),
                ),
                CustomFormField(
                  'CVV',
                  Icons.password_rounded,
                  TextInputType.number,
                  TextInputAction.done,
                  true,
                  (value) {
                    if (value!.length != 3) {
                      return 'Enter a valid CVV';
                    }
                  },
                  (value) => cvv = int.parse(value!),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        // fixedSize: Size(40, 40),
                        textStyle: Theme.of(context).textTheme.titleMedium),
                    onPressed: _Submit,
                    icon: Icon(Icons.add),
                    label: const Text('Add Credit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
