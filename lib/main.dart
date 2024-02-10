import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IEEE',
      theme: ThemeData(),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
