import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.record});

  final Map record;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/Pictures/1.jpg'),
      ),
      title: Text(record['title'].toString()),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.done_outline_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.archive_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
