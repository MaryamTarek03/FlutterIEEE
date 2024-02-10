import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/Grid/grid_view.dart';
import 'package:flutterieee/Screens/s3.dart';
import 'package:flutterieee/Screens/session02.dart';
import 'package:flutterieee/Screens/task01.dart';


final List<Widget> pages = [
  const WhatsAppHome(),
  const NewsApp(),
  const PointsCounter(),
  const MyGridView()
];

final List<String> pageNames = [
  'WhatsApp',
  'News App',
  'Points Counter',
  'Grid View',
];


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
            Expanded(child: TaskList())
          ],
        ),
      ),
    );
  }
}

class TaskButton extends StatelessWidget {
  const TaskButton({super.key, required this.index});
  final int index;

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  )
              ),
              Expanded(
                flex: 3,
                child: Hero(
                  tag: pageNames[index],
                  child: Text(
                    pageNames[index],
                    style: const TextStyle(color: Colors.black87,fontSize: 20),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pages.length,
      itemBuilder: (context, idx) {
        return TaskButton(index: idx);
      }
    );
  }
}