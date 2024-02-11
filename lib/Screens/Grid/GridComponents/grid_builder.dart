import 'package:flutter/material.dart';

import 'grid_container.dart';

class MyGridBuilder extends StatelessWidget {
  const MyGridBuilder({super.key, required this.myIcons});
  final List<Widget> myIcons;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => GridContainer(content: myIcons[index]),
      itemCount: myIcons.length,
    );
  }
}
