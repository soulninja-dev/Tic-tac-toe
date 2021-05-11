import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/pages/home_page.dart';
import '../functions.dart';
import 'winner_page.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

List<String> text = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
];
int plays = 0;

class _GamePageState extends State<GamePage> {
  Random rng = new Random();

  textStyle(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: "Poppins",
      color: white,
    );
  }

  ongoBack(dynamic value) {
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  // check who won and navigate to that screen
  void winnerAlert(String winner) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WinnerPage(winner),
      ),
    ).then(ongoBack);
  }

  void play(int index, bool isPlayer) {
    if (isPlayer) {
      if (text[index] == "") {
        setState(() {
          plays++;
          text[index] = "X";
        });
      }
      if (plays == 9) {
        winnerAlert("tie");
      }
      if (Functions.winCheck(text)) {
        winnerAlert("You");
      }
      // calling botPlay so that the game can continue
      // also checking for tiebreaker
      if (!Functions.winCheck(text) && plays < 9) {
        botPlay();
      }
    } else {
      // here only the bot can come in.
      // same check if the box isnt already taken. then changing text of index to "O"
      if (text[index] == "") {
        setState(() {
          plays++;
          text[index] = "O";
        });
      }
      if (plays == 9) {
        winnerAlert("tie");
      }
      if (Functions.winCheck(text)) {
        winnerAlert("Computer");
      }
    }
  }

  void botPlay() {
    // this function makes a random number using the nextInt function of Random class.
    int randomIndex = rng.nextInt(8);
    if (text[randomIndex] != "") {
      botPlay();
    } else {
      play(randomIndex, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold so that there is place for appbar etc.
    return Scaffold(
      // stack so that we can place more than 1 item in the body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 5),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(3.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (context, i) => SizedBox(
                child: TextButton(
                  onPressed: () {
                    if (text[i] == "") play(i, true);
                  },
                  child: Text(
                    text[i],
                    style: textStyle(50),
                  ),
                ),
              ),
            ),
          ),
          // the text to show what character the player is
          Expanded(
            flex: 1,
            child: Text(
              "You are: X",
              style: textStyle(25),
            ),
          ),
          Expanded(
            flex: 0,
            child: Text(
              "Developed by SoulNinja#7777",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white30,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: bg,
      // app bar to show some info
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: bg,
        title: Text(
          "Tic Tac Toe",
          style: textStyle(25),
        ),
        centerTitle: true,
      ),
    );
  }
}
