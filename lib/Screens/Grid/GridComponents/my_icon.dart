import 'package:flutter/material.dart';

Widget myIcon(IconData icon)
{
  return Icon(icon, size: 100, color: Colors.white, shadows: const [
    BoxShadow(color: Colors.pink, offset: Offset(5, 5)),
    BoxShadow(color: Colors.blue, offset: Offset(-5, 0))
  ]);
}