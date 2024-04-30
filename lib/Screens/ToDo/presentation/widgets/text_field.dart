import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  const MyField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.label,
    required this.icon, required this.onTap,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Date must not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        icon: Icon(icon),
      ),
    );
  }
}
