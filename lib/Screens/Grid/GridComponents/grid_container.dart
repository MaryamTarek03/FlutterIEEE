import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/Grid/GridComponents/alert_dialog.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({super.key, required this.content});
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => GridAlert(content: content,)),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 200, 220, 1),
          borderRadius: BorderRadius.circular(70),
        ),
        child: Center(child: content),
      ),
    );
  }
}
