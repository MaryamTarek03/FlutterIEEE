import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/ToDo/presentation/widgets/task.dart';

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key, required this.tasks});

  final List<Map> tasks;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: tasks.isNotEmpty,
      fallback: (context) => const Center(
        child: Text('There are no tasks'),
      ),
      builder: (context) => ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskItem(
          record: tasks[index],
        ),
      ),
    );
  }
}
