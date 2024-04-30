import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/ToDo/presentation/widgets/task.dart';

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key, required this.tasks});

  final List<Map>tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskItem(
        record: tasks[index],
      )
    );
  }
}