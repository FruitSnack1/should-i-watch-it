import 'package:flutter/material.dart';
import 'package:should_i_watch_it/search.dart';
import 'package:should_i_watch_it/searchResult.dart';
import 'package:should_i_watch_it/title.dart';

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
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 18, 18),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleText(),
              SizedBox(height: 60),
              Search(),
              SizedBox(height: 20),
              SearchResult(),
            ],
          ),
        ),
      ),
    );
  }
}
