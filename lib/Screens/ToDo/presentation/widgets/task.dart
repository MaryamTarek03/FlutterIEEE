import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart';

class TaskItem extends StatelessWidget {
  TaskItem({
    super.key,
    required this.record,
    required this.deleteFunction,
  });

  final Map record;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            foregroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(15),
          )
        ],
      ),
      child: ListTile(
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
      ),
    );
  }
}
