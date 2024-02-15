import 'package:flutter/material.dart';

class ShareAlert extends StatelessWidget {
  const ShareAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Share Via'),
      content: SizedBox(
        height: 150,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Icon(Icons.facebook,size: 90,),
              Icon(Icons.snapchat , size: 90,),
              Icon(Icons.telegram , size: 90,),
              Icon(Icons.tiktok , size: 90,),
              Icon(Icons.linked_camera , size: 90,),
            ],
          ),
        ),
      ),
    );
  }
}
