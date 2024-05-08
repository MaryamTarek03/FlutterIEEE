import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProductText extends StatelessWidget {
  ProductText({
    super.key,
    this.color = Colors.black,
    this.size = 22,
    required this.text,
  });

  Color color;
  double size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.aDLaMDisplay(
        color: color,
        fontSize: size,
      ),
    );
  }
}
