import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';

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
    return Container(
      color: bg,
      child: Column(
        children: <Widget>[
          Text(
            checkWinner(),
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: null,
              child: Text(
                "Play again",
              )),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
