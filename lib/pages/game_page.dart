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
List<int> player;
List<int> bot;
String toPlay;

class _GamePageState extends State<GamePage> {
  Random rng = new Random();

  var textstyle = TextStyle(
    fontSize: 50,
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
  );

  void play(int index, bool isPlayer) {
    // if (toPlay == "bot") bot.add(index);
    // if (toPlay == "player") player.add(index);

    // index is the position of the button in the grid,
    // isPlayer is true when the player clicks button and false when bot clicks button

    // if its a player, then check if the box isnt already taken
    // then setState the text of that index to "x"

    if (isPlayer) {
      if (text[index] == "") {
        setState(() {
          text[index] = "X";
          print("line 50");
          print(text);
          print("\n");
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
          print("line 67");
          print(text);
          print("\n");
        });
      }
      if (winCheck()) {
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
                    if (text[3] == "") play(3, true);
                  },
                  child: Text(
                    text[3],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (text[4] == "") play(4, true);
                  },
                  child: Text(text[4], style: textstyle),
                ),
                TextButton(
                  onPressed: () {
                    if (text[5] == "") play(5, true);
                  },
                  child: Text(
                    text[5],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (text[6] == "") play(6, true);
                  },
                  child: Text(
                    text[6],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (text[7] == "") play(7, true);
                  },
                  child: Text(
                    text[7],
                    style: textstyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (text[8] == "") play(8, true);
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
/*

  - make 2 lists
  - make a toplay var
  - when a button is clicked, add the index to the crsp list
  - and check if game is won, else set state.
  - then call bot play
  - bot play should first check if the match is won. else
  - bot play should make a random index and check if its already taken.
  - if not it should call itself again until it finds a proper index.
  - once it finds the proper index, delay and setstate.
  
*/
