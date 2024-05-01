import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart';
import 'package:flutterieee/Screens/ToDo/presentation/Theme/colors.dart';
import 'package:flutterieee/Screens/ToDo/presentation/widgets/show_task.dart';

// ignore: must_be_immutable
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              label: 'Delete',
              icon: Icons.delete,
              foregroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            // SlidableAction(
            //   onPressed: (context) {
            //     if (record['status'] == 'archived') {
            //       cubit.updateDB(status: 'new', id: record['ID']);
            //     } else {
            //       cubit.updateDB(status: 'archived', id: record['ID']);
            //     }
            //   },
            //   icon: record['status'] == 'archived'
            //       '?' Icons.unarchive
            //       : Icons.archive,
            //   foregroundColor: ToDoColors.archive,
            //   // borderRadius: BorderRadius.circular(20),
            // ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            Icons.keyboard_double_arrow_right_outlined,
            color: ToDoColors.light,
            size: 50,
          ),
          contentPadding: const EdgeInsets.all(12),
          tileColor: ToDoColors.primaryLight,
          textColor: ToDoColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetails(record: record),
              ),
            );
          },
          title: Text(
            record['title'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            '${record['date']} At ${record['time']}',
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
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
                  icon: record['status'] == 'finished'
                      ? Icon(
                          Icons.unpublished_outlined,
                          color: ToDoColors.light,
                        )
                      : Icon(
                          Icons.task_alt_rounded,
                          color: ToDoColors.light,
                          size: 25,
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
                  icon: Icon(
                    record['status'] == 'archived'
                        ? Icons.unarchive_outlined
                        : Icons.archive_outlined,
                    color: ToDoColors.light,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
