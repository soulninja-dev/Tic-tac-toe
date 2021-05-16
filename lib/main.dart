import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/pages/home_page.dart';

import 'pages/game_page_v2.dart';

void main() {
  // MyApp is getting called.
  runApp(MyApp());
}

// class MyApp is the root class of the tree
// it returns a MaterialApp which is a stateless widget.
// it sets the themedata and called HomePage as the main body.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      theme: ThemeData(
        fontFamily: 'Poppins',
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: btnbg,
            elevation: 5.0,
          ),
        ),
      ),
      routes: {
        '/': (context) => HomePage(),
        '/game': (context) => GamePage(),
      }
    );
  }
}
