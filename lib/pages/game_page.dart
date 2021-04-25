import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';

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
  play(int index, bool isPlayer) {
    // if its a player, then check if the box isnt already taken
    // then setState the text of that index to "x"
    if (isPlayer) {
      if (text[index] == "") {
        setState(() {
          text[index] = "X";
        });
      }
      // calling botPlay so that the game can continue
      botPlay();
    } else {
      // here only the bot can come in.
      // same check if the box isnt already taken. then changing text of index to "O"
      if (text[index] == "") {
        setState(() {
          text[index] = "O";
        });
      }
    }
  }

  // this function makes a random number using the nextInt function of Random class.
  botPlay() {
    int randomIndex = rng.nextInt(8);
    if (text[randomIndex] != "") {
      botPlay();
    } else {
      // changes toPlay so that bot can play
      play(randomIndex, false);
    }
  }

  // initState is supposed to be called every time the page opens
  @override
  void initState() {
    super.initState();
    botPlay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 75, 5, 0),
            child: GridView.count(
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              crossAxisCount: 3,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    if (text[0] == "") play(0, true);
                  },
                  child: Text(text[0]),
                ),
                TextButton(
                  onPressed: () {
                    if (text[1] == "") play(1, true);
                  },
                  child: Text(text[1]),
                ),
                TextButton(
                  onPressed: () {
                    if (text[2] == "") play(2, true);
                  },
                  child: Text(text[2]),
                ),
                TextButton(
                  onPressed: () {
                    play(3, true);
                  },
                  child: Text(text[3]),
                ),
                TextButton(
                  onPressed: () {
                    play(4, true);
                  },
                  child: Text(text[4]),
                ),
                TextButton(
                  onPressed: () {
                    play(5, true);
                  },
                  child: Text(text[5]),
                ),
                TextButton(
                  onPressed: () {
                    play(6, true);
                  },
                  child: Text(text[6]),
                ),
                TextButton(
                  onPressed: () {
                    play(7, true);
                  },
                  child: Text(text[7]),
                ),
                TextButton(
                  onPressed: () {
                    play(8, true);
                  },
                  child: Text(text[8]),
                ),
              ],
            ),
          ),
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
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: bg,
        title: Text("Tic Tac Toe"),
        centerTitle: true,
      ),
    );
  }
}
