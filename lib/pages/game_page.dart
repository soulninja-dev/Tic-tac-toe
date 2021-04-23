import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

List<bool> playedArr = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

List<String> text = [
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
];

String toPlay = "X";

class _GamePageState extends State<GamePage> {
  Random rng = new Random();

  play(int index) {
    text[index] = toPlay;
    playedArr[index] = true;
  }

  botPlay() {
    int randomIndex = rng.nextInt(8);
    if (playedArr[randomIndex] == true) {
      botPlay();
    } else {
      // changes toPlay so that bot can play
      change_toPlay(toPlay);
      play(randomIndex);
    }
  }

  // ignore: non_constant_identifier_names
  change_toPlay(String current) {
    if (current == "X") {
      setState(() {
        toPlay = "Y";
      });
    }
    if (current == "Y") {
      setState(() {
        toPlay = "X";
      });
    }
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
                    play(0);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[0]),
                ),
                TextButton(
                  onPressed: () {
                    play(1);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[1]),
                ),
                TextButton(
                  onPressed: () {
                    play(2);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[2]),
                ),
                TextButton(
                  onPressed: () {
                    play(3);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[3]),
                ),
                TextButton(
                  onPressed: () {
                    play(4);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[4]),
                ),
                TextButton(
                  onPressed: () {
                    play(5);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[5]),
                ),
                TextButton(
                  onPressed: () {
                    play(6);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[6]),
                ),
                TextButton(
                  onPressed: () {
                    play(7);
                    botPlay();
                    change_toPlay(toPlay);
                  },
                  child: Text(text[7]),
                ),
                TextButton(
                  onPressed: () {
                    play(8);
                    botPlay();
                    change_toPlay(toPlay);
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
                "You are: $toPlay",
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

/*
  [x] Boolean played array -> to store which buttons are clicked
  
  [x] function play -> to take in index and change text on it to whatever toPlay is
                      -> should change played array also

  [x] function botPlay -> random from 0-8 and check if the box is taken in played array and call play

  [x] function change_toPlay -> change the text in toPlay

  [x] String toPlay -> variable X or Y to show in the bottom part 


  flow: 

  button is clicked 
        ||
  play(index) is called with index
        ||
  play(index) updates text and playedArr
        ||
  botPlay() is called
        ||
  checks if playedArr is true, if yes calls botPlay again else calls play(index)
        ||
    { CHECK NEEDED HERE }
        ||
  then play(index) will play the bot's move 
        ||
  change_toPlay is called ;-;

*/
