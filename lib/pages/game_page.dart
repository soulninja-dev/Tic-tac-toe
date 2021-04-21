import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static const toPlay = "X";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: GridView.count(
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: 3,
          children: <Widget>[
            TextButton(
              onPressed: () => print("pressed 1"),
              child: Text("here1"),
            ),
            TextButton(
              onPressed: () => print("pressed 2"),
              child: Text("here2"),
            ),
            TextButton(
              onPressed: () => print("pressed 3"),
              child: Text("here3"),
            ),
            TextButton(
              onPressed: () => print("pressed 4"),
              child: Text("here4"),
            ),
            TextButton(
              onPressed: () => print("pressed 5"),
              child: Text("here4"),
            ),
            TextButton(
              onPressed: () => print("pressed 6"),
              child: Text("here4"),
            ),
            TextButton(
              onPressed: () => print("pressed 7"),
              child: Text("here4"),
            ),
            TextButton(
              onPressed: () => print("pressed 8"),
              child: Text("here4"),
            ),
            TextButton(
              onPressed: () => print("pressed 9"),
              child: Text("here4"),
            ),
          ],
        ),
      ),
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text("Tic Tac Toe"),
        actions: [
          Text("$toPlay to play"),
        ],
      ),
    );
  }
}
