import 'package:flutter/material.dart';

class GridAlert extends StatelessWidget {
  const GridAlert({super.key, required this.content});

  final Widget content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: const EdgeInsets.all(40.0),
        child: content,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
