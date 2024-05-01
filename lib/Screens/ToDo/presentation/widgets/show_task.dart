import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/ToDo/presentation/Theme/colors.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.record});

  final Map record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        centerTitle: true,
        foregroundColor: ToDoColors.light,
        backgroundColor: ToDoColors.primaryLight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              record['date'] + ' At ' + record['time'],
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              record['title'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
