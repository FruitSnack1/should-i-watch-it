import 'package:flutter/material.dart';
import 'package:should_i_watch_it/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        backgroundColor: Color.fromARGB(255, 18, 18, 18),
        accentColor: Color.fromARGB(255, 59, 59, 59),
        primaryColor: Color.fromARGB(255, 174, 174, 174),
      ),
    );
  }
}
