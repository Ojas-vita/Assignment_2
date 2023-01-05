import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo List",
      theme: ThemeData(
          hoverColor: Colors.white38,
          primarySwatch: Colors.deepOrange,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          )),
      home: HomePage(),
    );
  }
}
