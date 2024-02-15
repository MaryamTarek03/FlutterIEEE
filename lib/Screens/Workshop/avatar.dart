import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/Pictures/Workshop/chat.jpg'),
              radius: 50,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Pictures/Workshop/flutter-logo.jpg'),
                radius: 10,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black45,
                  child: Text(
                    '+5',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
