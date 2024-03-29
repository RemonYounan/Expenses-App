import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.label,
    required this.icon,
    required this.kType,
    required this.inputAction,
    required this.obscure,
    required this.validator,
    required this.onSaved,
  });
  final String label;
  final IconData icon;
  final TextInputType kType;
  final TextInputAction inputAction;
  final bool obscure;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 14),
          labelStyle: Theme.of(context).textTheme.titleMedium,
          labelText: label,
          icon: Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
          ),
          iconColor: Theme.of(context).colorScheme.secondary,
        ),
        keyboardType: kType,
        textInputAction: inputAction,
        obscureText: obscure,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
