import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    /*
    Colors and Constants
    */
    Color buttonColor = getButtonColor(text);
    Color foreColor = getForeColor(text);
    Color buttonTextColor = Colors.white;
    double btnSize = MediaQuery.of(context).size.width * .18;
    double btnTextRatio = isNumeric(text) ? 0.3 : 0.5;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: const MaterialStatePropertyAll(CircleBorder()),
        fixedSize: MaterialStatePropertyAll(Size(btnSize, btnSize)),
        backgroundColor: MaterialStatePropertyAll(buttonColor),
        surfaceTintColor: MaterialStatePropertyAll(buttonColor),
        overlayColor: MaterialStatePropertyAll(foreColor),
        elevation: const MaterialStatePropertyAll(0),
        alignment: Alignment.center,
      ),
      child: Text(
        text,
        style: GoogleFonts.aBeeZee(
          fontSize: (btnSize * btnTextRatio),
          color: buttonTextColor,
        ),
      ),
    );
  }
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

Color getButtonColor(String text) {
  if (isNumeric(text)) return const Color.fromRGBO(27, 27, 27, 1);
  if (text == '=') return const Color.fromRGBO(103, 103, 233, 1);
  return const Color.fromRGBO(50, 50, 50, 1);
}

Color getForeColor(String text) {
  if (isNumeric(text)) return const Color.fromRGBO(50, 50, 50, 1);
  if (text == '=') return const Color.fromRGBO(150, 113, 243, 1);
  return const Color.fromRGBO(70, 70, 70, 1);
}
