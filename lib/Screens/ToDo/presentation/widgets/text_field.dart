import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/ToDo/presentation/Theme/colors.dart';

class MyField extends StatelessWidget {
  const MyField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'This field should\'nt be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: ToDoColors.primary,
          ),
          icon: Icon(icon),
          iconColor: ToDoColors.primary,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ToDoColors.primaryVeryLight,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ToDoColors.primary,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
