import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';
import 'package:tictactor/pages/game_page.dart';
import '../functions.dart';

// ignore: must_be_immutable
class WinnerPage extends StatelessWidget {
  String winner;
  WinnerPage(String winner) {
    this.winner = winner;
  }
  String checkWinner() {
    if (winner == "tie") {
      return "Tie Breaker!!";
    }
    if (winner == "Computer") {
      return "You lost :(";
    }
    if (winner == "You") {
      return "Yay! you won";
    }
    return "code will never reach here lol";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              checkWinner(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: () {
                Functions.reset();
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamePage(),
                  ),
                );
              },
              child: Text(
                "Play again",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
