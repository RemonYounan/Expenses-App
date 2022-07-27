import 'package:flutter/material.dart';
import 'package:personal_expenses/others/drop_down_menu.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/screens/main_screen.dart';
import 'package:personal_expenses/widgets/custom_form_filed.dart';
import 'package:provider/provider.dart';

class AddCreditScreen extends StatefulWidget {
  AddCreditScreen({required this.first, Key? key}) : super(key: key);
  static const routeName = '/add-credit-screen';
  bool first;

  @override
  State<AddCreditScreen> createState() => _AddCreditScreenState();
}

class _AddCreditScreenState extends State<AddCreditScreen> {
  String type = 'Select one';
  final _formKey = GlobalKey<FormState>();
  String? name;
  int? number;
  String exMonth = '1';
  String exYear = '22';
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
      widget.first
          ? Navigator.pushReplacementNamed(context, MainScreen.routeName)
          : Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Add a crdit card'),
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
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: size.width * .5,
                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(15),
                          style: Theme.of(context).textTheme.titleMedium,
                          value: type,
                          hint: const Text(
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
                            iconColor: Theme.of(context).colorScheme.secondary,
                          ),
                          dropdownColor: Theme.of(context).cardColor,
                          items: const [
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
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'User Name',
                  icon: Icons.text_fields_rounded,
                  kType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  obscure: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid username';
                    }
                    return null;
                  },
                  onSaved: (value) => name = value,
                ),
                CustomFormField(
                  label: 'Credit Number',
                  icon: Icons.numbers,
                  kType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  obscure: false,
                  validator: (value) {
                    if (value!.length != 16 || value.isEmpty) {
                      return 'Enter a valid credit number';
                    }
                    return null;
                  },
                  onSaved: (value) => number = int.parse(value!),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(
                          width: size.width * .4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Expiry Month',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .4,
                          child: DropdownButtonFormField(
                            dropdownColor: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15),
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
                                  fontWeight: FontWeight.w500,
                                ),
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
                        Icon(
                          Icons.date_range,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(
                          width: size.width * .4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Expiry Year',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .4,
                          child: DropdownButtonFormField(
                            dropdownColor: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15),
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
                                  fontWeight: FontWeight.w500,
                                ),
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
                  label: 'PIN',
                  icon: Icons.password_rounded,
                  kType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  obscure: true,
                  validator: (value) {
                    if (value!.length != 4) {
                      return 'Enter a valid PIN';
                    }
                    return null;
                  },
                  onSaved: (value) => pin = int.parse(value!),
                ),
                CustomFormField(
                  label: 'CVV',
                  icon: Icons.password_rounded,
                  kType: TextInputType.number,
                  inputAction: TextInputAction.done,
                  obscure: true,
                  validator: (value) {
                    if (value!.length != 3) {
                      return 'Enter a valid CVV';
                    }
                    return null;
                  },
                  onSaved: (value) => cvv = int.parse(value!),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: _Submit,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Credit'),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                if (widget.first)
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MainScreen.routeName);
                    },
                    child: const Text('Skip'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
