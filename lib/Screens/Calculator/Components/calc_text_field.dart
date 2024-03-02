import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcTextField extends StatefulWidget {
  const CalcTextField({super.key, required this.text});

  final String text;

  @override
  State<CalcTextField> createState() => _CalcTextFieldState();
}

class _CalcTextFieldState extends State<CalcTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(15),
      child: Text(
        widget.text,
        style: GoogleFonts.aBeeZee(
          fontSize: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}
