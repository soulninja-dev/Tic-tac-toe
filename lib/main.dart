import 'package:flutter/material.dart';
import 'package:tictactor/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      home: HomePage(),
      theme: ThemeData(fontFamily: 'Cooper'),
    );
  }
}
