import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/ToDo/presentation/screens/todo_home.dart';
import 'package:flutterieee/Screens/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IEEE',
      theme: ThemeData(),
      home: const ToDoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
