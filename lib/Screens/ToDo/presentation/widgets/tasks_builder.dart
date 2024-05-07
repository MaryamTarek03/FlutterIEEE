import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart';
import 'package:flutterieee/Screens/ToDo/presentation/widgets/task.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key, required this.tasks});

  final List<Map> tasks;

  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    return ConditionalBuilder(
      condition: tasks.isNotEmpty,
      fallback: (context) => Center(
        child: Text(
          'There are no tasks in here',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSansOriya(
            fontSize: 30,
            color: Colors.blueGrey[300],
          ),
        ),
      ),
      builder: (context) => ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskItem(
          record: tasks[index],
          deleteFunction: (context) =>
              cubit.deleteFromDB(id: tasks[index]['ID']),
        ),
      ),
    );
  }
}
