import 'package:flutter/material.dart';
import 'package:tictactoe/pages/game_page_v2.dart';
import 'package:tictactoe/widgets/enter_username.dart';
import '../constants.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  moveToGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(),
      ),
    );
  }

  // build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Tic Tac Toe",
            style: TextStyle(
              fontSize: 55,
              color: white,
              shadows: [
                Shadow(
                  color: Colors.white10,
                  offset: Offset(5, 5),
                  blurRadius: 1.0,
                ),
              ],
              fontWeight: FontWeight.normal,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: EnterUsername(br: br),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: black,
                  primary: white,
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  moveToGame(context);
                },
                child: Text("Play Now"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
