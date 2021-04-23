import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
/*
  Boolean played array -> to store which buttons are clicked
  
  function play -> to take in index and change text on it to whatever toPlay is
                      -> should change played array also

  function botPlay -> random from 0-8 and check if the box is taken in played array and call play

  function change_toPlay -> change the text in toPlay

  String toPlay -> variable X or Y to show in the bottom part 
*/

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

  static String toPlay = "X";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 75, 5, 0),
            child: GridView.count(
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              crossAxisCount: 3,
              children: <Widget>[
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here1"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here2"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here3"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here4"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here5"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here6"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here7"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here8"),
                ),
                TextButton(
                  onPressed: () => change_toPlay(toPlay),
                  child: Text("here9"),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 420),
              child: Text(
                "To Play: $toPlay",
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
