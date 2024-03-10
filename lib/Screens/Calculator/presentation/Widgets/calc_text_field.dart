import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcTextField extends StatefulWidget {
  const CalcTextField({super.key, required this.text, required this.subText});

  final String text;
  final String subText;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.subText,
            style: GoogleFonts.aBeeZee(
              fontSize: 36,
              color: Colors.white70,
            ),
          ),
          Text(
            widget.text,
            style: GoogleFonts.aBeeZee(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
