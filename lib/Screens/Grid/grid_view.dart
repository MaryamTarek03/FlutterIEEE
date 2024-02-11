import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/Grid/GridComponents/grid_builder.dart';

import 'GridComponents/grid_items.dart';


class MyGridView extends StatelessWidget {
  const MyGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Hero(
        tag: 'Grid View',
        child: Text(
            'Grid View',
            style: TextStyle(color: Colors.black,fontSize: 20)
        ),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: MyGridBuilder(myIcons: myIcons),
      ),
    );
  }
}