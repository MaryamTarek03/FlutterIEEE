import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart";

class ToDoHome extends StatelessWidget {
  const ToDoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit()..createDB(),
      child: BlocConsumer<ToDoCubit, ToDoState>(
        listener: (context, state) => ToDoCubit(),
        builder: (context, state) {
          var cubit = ToDoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex, // cubit.currentIndex
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt_rounded),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done_all_rounded),
                  label: 'Finished',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_rounded),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
