import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutterieee/Screens/ToDo/logic/cubit/to_do_cubit.dart";
import "package:flutterieee/Screens/ToDo/presentation/Theme/colors.dart";
import "package:flutterieee/Screens/ToDo/presentation/widgets/text_field.dart";
import "package:intl/intl.dart";

// ignore: must_be_immutable
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
            backgroundColor: ToDoColors.light,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              centerTitle: true,
              backgroundColor: ToDoColors.light,
              foregroundColor: ToDoColors.primaryLight,
              surfaceTintColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: cubit.screens[cubit.currentIndex],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: ToDoColors.primaryLight,
                foregroundColor: ToDoColors.light,
                elevation: 3,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    elevation: 20,
                    backgroundColor: ToDoColors.light,
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) => Center(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(35.0),
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
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.pop(context);
                                        cubit.insertDB(
                                          time: timeController.text,
                                          date: dateController.text,
                                          title: textController.text,
                                        );
                                        timeController.text = '';
                                        dateController.text = '';
                                        textController.text = '';
                                      }
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                        ToDoColors.primaryLight,
                                      ),
                                      foregroundColor: MaterialStatePropertyAll(
                                          ToDoColors.light),
                                    ),
                                    child: const Text('Add'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              backgroundColor: ToDoColors.light,
              selectedItemColor: ToDoColors.primary,
              elevation: 0,
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
