import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';
import 'package:tictactor/pages/home_page.dart';

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

class _GamePageState extends State<GamePage> {
  Random rng = new Random();

  // index is the position of the button in the grid,
  // isPlayer is true when the player clicks button and false when bot clicks button
  void play(int index, bool isPlayer) {
    // if its a player, then check if the box isnt already taken
    // then setState the text of that index to "x"

    if (isPlayer) {
      if (text[index] == "") {
        setState(() {
          text[index] = "X";
        });
      }
      if (winCheck()) {
        winnerAlert("You");
      }
      // calling botPlay so that the game can continue
      if (!winCheck()) {
        botPlay();
      }
    } else {
      // here only the bot can come in.
      // same check if the box isnt already taken. then changing text of index to "O"
      if (text[index] == "") {
        setState(() {
          text[index] = "O";
        });
      }
      if (winCheck()) {
        winnerAlert("Computer");
      }
    }
  }

  // this function makes a random number using the nextInt function of Random class.
  void botPlay() {
    int randomIndex = rng.nextInt(8);
    if (text[randomIndex] != "") {
      botPlay();
    } else {
      // changes toPlay so that bot can play
      play(randomIndex, false);
    }
  }

/*
Possibilities to win:
012
345
678
036
147
258
048
246
*/
  // simple check if the possibilities match or not
  // this will check if the game is finished or not
  bool winCheck() {
    // 012
    if (text[0] != "" && text[0] == text[1] && text[1] == text[2]) {
      return true;
    }
    // 345
    else if (text[3] != "" && text[3] == text[4] && text[4] == text[5]) {
      return true;
    }
    // 678
    else if (text[6] != "" && text[6] == text[7] && text[7] == text[8]) {
      return true;
    }
    // 036
    else if (text[0] != "" && text[0] == text[3] && text[3] == text[6]) {
      return true;
    }
    // 147
    else if (text[1] != "" && text[1] == text[4] && text[4] == text[7]) {
      return true;
    }
    // 258
    else if (text[2] != "" && text[2] == text[5] && text[5] == text[8]) {
      return true;
    }
    // 048
    else if (text[0] != "" && text[0] == text[4] && text[4] == text[8]) {
      return true;
    }
    // 246
    else if (text[2] != "" && text[2] == text[4] && text[4] == text[6]) {
      return true;
    }
    return false;
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

/*
      // initState is supposed to be called every time the page opens
      @override
      void initState() {
        super.initState();
        // calling botPlay when the page is opened, so that the bot plays first and there is no empty box in the end.
        // emptybox can be played if we click it twice 🤔
        botPlay();
      }
*/
  var textstyle = TextStyle(
    fontSize: 50,
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    // Scaffold so that there is place for appbar etc.
    return Scaffold(
      // stack so that we can place more than 1 item in the body
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 75, 5, 0),
            // gridview.count is a good widget to build grids.
            child: GridView.count(
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              crossAxisCount: 3,
              children: <Widget>[
                // each TextButton is a grid which can be pressed.
                TextButton(
                  onPressed: () {
                    if (text[0] == "") play(0, true);
                  },
                  child: Text(
                    text[0],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (text[1] == "") play(1, true);
                  },
                  child: Text(
                    text[1],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (text[2] == "") play(2, true);
                  },
                  child: Text(
                    text[2],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    play(3, true);
                  },
                  child: Text(
                    text[3],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    play(4, true);
                  },
                  child: Text(text[4], style: textstyle),
                ),
                TextButton(
                  onPressed: () {
                    play(5, true);
                  },
                  child: Text(
                    text[5],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    play(6, true);
                  },
                  child: Text(
                    text[6],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    play(7, true);
                  },
                  child: Text(
                    text[7],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    play(8, true);
                  },
                  child: Text(
                    text[8],
                    style: textstyle,
                  ),
                ),
              ],
            ),
          ),
          // the text to show what character the player is
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 420),
              child: Text(
                "You are: X",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 25,
                ),
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
        title: Text("Tic Tac Toe"),
        centerTitle: true,
      ),
    );
  }
}
