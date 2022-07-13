import 'package:flutter/material.dart';
import 'package:personal_expenses/others/drop_down_menu.dart';
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
  String type = 'Select one';
  final _formKey = GlobalKey<FormState>();
  String? name;
  int? number;
  var exMonth = '1';
  var exYear = '22';
  int? pin;
  int? cvv;

  void _Submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final credit = Provider.of<CreditCards>(context, listen: false);
      final _expiryDate = '$exMonth/$exYear';
      credit.AddCreditCard(
        type,
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Add a crdit card'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.credit_card_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Credit type :',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 19,
                                  ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 220,
                        child: DropdownButtonFormField(
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 16),
                            value: type,
                            hint: Text(
                              'Selecte one',
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              iconColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            dropdownColor: Theme.of(context).cardColor,
                            items: [
                              DropdownMenuItem(
                                value: 'Select one',
                                child: Text(
                                  'Selecte one',
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Master Card',
                                child: Text(
                                  'Master Card',
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Visa',
                                child: Text(
                                  'Visa',
                                ),
                              ),
                            ],
                            validator: (value) =>
                                value == 'Select one' ? 'Select type' : null,
                            onChanged: (String? value) {
                              setState(() {
                                type = value!;
                              });
                            }),
                      ),
                    ],
                  ),
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
                    return null;
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
                    return null;
                  },
                  (value) => number = int.parse(value!),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.date_range,
                            color: Theme.of(context).colorScheme.secondary),
                        SizedBox(
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Expiry Month',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: DropdownButtonFormField(
                            dropdownColor: Theme.of(context).cardColor,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                            value: exMonth,
                            items: monthDropdownItems,
                            onChanged: (String? value) {
                              setState(() {
                                exMonth = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.date_range,
                            color: Theme.of(context).colorScheme.secondary),
                        SizedBox(
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Expiry Year',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: DropdownButtonFormField(
                            dropdownColor: Theme.of(context).cardColor,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                            value: exYear,
                            items: yearDropdownItems,
                            onChanged: (String? value) {
                              setState(() {
                                exYear = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    return null;
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
                    return null;
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
