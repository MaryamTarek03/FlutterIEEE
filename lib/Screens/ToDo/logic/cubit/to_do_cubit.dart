import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/ToDo/presentation/screens/archived_tasks.dart';
import 'package:flutterieee/Screens/ToDo/presentation/screens/finished_task.dart';
import 'package:flutterieee/Screens/ToDo/presentation/screens/new_task.dart';
import 'package:sqflite/sqflite.dart';

part 'to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoInitial());
  static ToDoCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = const [
    NewTasks(),
    FinishedTasks(),
    ArchivedTasks(),
  ];

  List<String> titles = [
    'Tasks',
    'Finished Tasks',
    'Archived Tasks',
  ];

  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

  late Database database;
  List<Map<String, dynamic>> newTasks = [];
  List<Map<String, dynamic>> finishedTasks = [];
  List<Map<String, dynamic>> archivedTasks = [];

  void createDB() async {
    await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE tasks(ID INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)
        ''').then(
            (value) {});
      },
      // onOpen: (db) {
      //   getRecordsFromDB();
      // },
    ).then((value) {
      database = value;
      getRecordsFromDB();
    }).catchError((error) {});
  }

  void getRecordsFromDB() async {
    newTasks = [];
    finishedTasks = [];
    archivedTasks = [];

    emit(GetRecordsLoadingState());
    await database
        .rawQuery(
      'SELECT * FROM tasks',
    )
        .then((value) {
      for (var row in value) {
        if (row['status'] == 'new') {
          newTasks.add(row);
        } else if (row['status'] == 'finished') {
          finishedTasks.add(row);
        } else {
          archivedTasks.add(row);
        }
      }
      emit(GetRecordsState());
      //print(value);
    }).catchError((error) {});
  }

  void insertDB({
    required String title,
    required String date,
    required String time,
    String status = 'new',
  }) async {
    await database
        .rawInsert(
            'INSERT INTO tasks(title, date, time, status) VALUES("$title" , "$date","$time","$status")')
        .then((value) {
      emit(InsertState());
      getRecordsFromDB();
    }).catchError((error) {});
  }

  void updateDB({
    required String status,
    required int id,
  }) async {
    await database.rawUpdate(
      'UPDATE tasks SET status=? WHERE id=?',
      [status, id],
    ).then((value) {
      emit(UpdateState());
      getRecordsFromDB();
    });
  }

  void deleteFromDB({
    required int id,
  }) async {
    await database.rawDelete(
      'DELETE FROM tasks WHERE id=?',
      [id],
    ).then((value) {
      emit(DeleteState());
      getRecordsFromDB();
    });
  }
}
