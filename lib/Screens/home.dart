import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/session02.dart';
import 'package:flutterieee/Screens/task01.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 10),
              child: Image(image: AssetImage("assets/Pictures/chairandtable.png") , height: 200,),
            ),
            Text("H  O  M  E", style: TextStyle(
              fontSize: 60,
            ),),
            SizedBox(height: 20,),
            TaskButton(text: "1: WhatsApp Home", check: 1,),
            TaskButton(text: "2: News App", check: 2,)
          ],
        ),
      ),
    );
  }
}

class TaskButton extends StatelessWidget {
  const TaskButton({super.key, required this.check, required this.text });
  final int check;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(40)
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => goTo(check)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.black87,fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}

Widget goTo(int check)
{
  switch (check)
  {
    case 1:
      return const WhatsAppHome();
    case 2:
      return const S2App01();
    default:
      return const S2App01();
  }
}