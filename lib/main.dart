import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/DummyProducts/data/helper/dio_helper.dart';
import 'package:flutterieee/Screens/home.dart';

void main() {
  DioHelper.init();
  runApp(
    DevicePreview(builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IEEE',
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.white,
        ),
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
