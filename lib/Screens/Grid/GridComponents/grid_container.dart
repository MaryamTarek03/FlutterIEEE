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
          builder: (BuildContext context) => GridAlert(
                content: content,
              )),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            // image: const DecorationImage(
            //     image: AssetImage('assets/Pictures/nature_sunrise.jpg'),
            //     fit: BoxFit.cover,
            //     colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.darken)),
            color: const Color.fromRGBO(255, 200, 220, 1),
            borderRadius: BorderRadius.circular(70),
            boxShadow: const [
              // BoxShadow(
              //   offset: Offset(-5,5),
              //   color: Colors.black,
              //   blurRadius: 5,
              // )
            ]),
        child: Center(child: content),
      ),
    );
  }
}
