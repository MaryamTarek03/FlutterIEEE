import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart";
import "package:flutterieee/Screens/ToDo/presentation/widgets/text_field.dart";
import "package:intl/intl.dart";

class ToDoHome extends StatelessWidget {
  ToDoHome({super.key});

  var formKey = GlobalKey<FormState>();
  var textController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  builder: (context) => Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyField(
                            controller: textController,
                            inputType: TextInputType.text,
                            label: 'Title',
                            icon: Icons.text_fields_rounded,
                            onTap: () {},
                          ),
                          MyField(
                            controller: timeController,
                            inputType: TextInputType.none,
                            label: 'Time',
                            icon: Icons.timer_outlined,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                if (value != null) {
                                  timeController.text =
                                      value.format(context).toString();
                                }
                              });
                            },
                          ),
                          MyField(
                            controller: dateController,
                            inputType: TextInputType.none,
                            label: 'Date',
                            icon: Icons.date_range_outlined,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2055-12-29'),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value);
                                  }
                                },
                              );
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // insert new task in database
                                cubit.insertDB(
                                  time: timeController.text,
                                  date: dateController.text,
                                  title: textController.text,
                                ); // then >> (reset fields && close bottom sheet) in listener
                              }
                            },
                            child: Text('Add'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
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
