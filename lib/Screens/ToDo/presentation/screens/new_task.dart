import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart';
import 'package:flutterieee/Screens/ToDo/presentation/widgets/tasks_builder.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDoState>(
      listener: (context, state) => ToDoCubit(),
      builder: (context, state) {
        var cubit = ToDoCubit.get(context);
        return TaskBuilder(tasks: cubit.newTasks);
      },
    );
  }
}
