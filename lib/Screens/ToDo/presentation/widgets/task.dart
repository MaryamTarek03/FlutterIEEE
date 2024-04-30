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
                onPressed: () {
                  if (record['status'] == 'new' ||
                      record['status'] == 'archived') {
                    cubit.updateDB(status: 'finished', id: record['ID']);
                  } else {
                    cubit.updateDB(status: 'new', id: record['ID']);
                  }
                },
                icon: record['status'] == 'new'
                    ? Icon(Icons.done_outline_rounded)
                    : Icon(
                        Icons.done_rounded,
                        color: record['status'] == 'finished'
                            ? Colors.green
                            : Colors.grey,
                      ),
              ),
              IconButton(
                onPressed: () {
                  if (record['status'] == 'archived') {
                    cubit.updateDB(status: 'new', id: record['ID']);
                  } else {
                    cubit.updateDB(status: 'archived', id: record['ID']);
                  }
                },
                icon: Icon(Icons.archive_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
