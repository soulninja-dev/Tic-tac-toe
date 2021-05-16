import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/pages/winner_page.dart';
import 'package:tictactoe/functions.dart';

import 'home_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

// VARIABLES

bool play = true;
bool isGameOver = false;
String humanLetter = "X";
String botLetter = "O";
int randomIndex = 0;
List<String> humanPlays = [];
List<String> botPlays = [];
List<String> board = ["", "", "", "", "", "", "", "", ""];

class _GamePageState extends State<GamePage> {
  Random rng = new Random();

  // FUNCTIONS
  void clicked(int index) async {
    // set state of the board
    setState(() {
      humanPlays.add(index.toString());
      board[index] = humanLetter;
    });
    int result = await whoIsWinner();
    await winCheck(result);
    if (!isGameOver) await botPlay();
  }

  Future<int> whoIsWinner() async {
    // board is empty
    if (!board.contains("X") && !board.contains("O"))
      return 0;
    // human win check
    else if (existsHuman(["0", "1", "2"]) ||
        existsHuman(["0", "3", "6"]) ||
        existsHuman(["7", "4", "1"]) ||
        existsHuman(["8", "5", "2"]) ||
        existsHuman(["3", "4", "5"]) ||
        existsHuman(["6", "7", "8"]) ||
        existsHuman(["0", "4", "8"]) ||
        existsHuman(["2", "4", "6"]))
      return 1;
    // bot win check
    else if (existsBot(["0", "1", "2"]) ||
        existsBot(["0", "3", "6"]) ||
        existsBot(["7", "4", "1"]) ||
        existsBot(["8", "5", "2"]) ||
        existsBot(["3", "4", "5"]) ||
        existsBot(["6", "7", "8"]) ||
        existsBot(["0", "4", "8"]) ||
        existsBot(["2", "4", "6"]))
      return 2;
    // tie check
    else if (!board.contains(""))
      return 3;
    // no one has won yet, game will continue
    else
      return 0;
  }

  winCheck(int result) async {
    switch (result) {
      // game will continue
      case 0:
        break;
      case 1:
        moveToWinner("You");
        isGameOver = true;
        break;
      case 2:
        moveToWinner("bot");
        isGameOver = true;
        break;
      case 3:
        moveToWinner("tie");
        isGameOver = true;
        break;
      default:
        break;
    }
  }

  void getRandomIndex() {
    randomIndex = rng.nextInt(8);
    if (board[randomIndex] != "") getRandomIndex();
  }

  botPlay() async {
    getRandomIndex();
    await Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        botPlays.add(randomIndex.toString());
        board[randomIndex] = botLetter;
        play = true;
      });
    });
    int result = await whoIsWinner();
    await winCheck(result);
  }

  ongoBack(dynamic value) {
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  moveToHome(dynamic value) {
    Navigator.pop(
      context,
      ModalRoute.withName('/'),
    );
  }

  moveToWinner(String winner) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WinnerPage(winner),
      ),
    ).then(
      moveToHome,
    );
  }

  bool existsHuman(List<String> arr) {
    if (humanPlays.contains(arr[0]) &&
        humanPlays.contains(arr[1]) &&
        humanPlays.contains(arr[2])) return true;
    return false;
  }

  bool existsBot(List<String> arr) {
    if (botPlays.contains(arr[0]) &&
        botPlays.contains(arr[1]) &&
        botPlays.contains(arr[2])) return true;
    return false;
  }

  textStyle(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: "Poppins",
      color: white,
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        leading: Text(""),
        title: Text(
          "Tic Tac Toe",
          style: textStyle(25),
        ),
        centerTitle: true,
      ),
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
                    if (play &&
                        board[i] == "" &&
                        !botPlays.contains(i.toString())) {
                      clicked(i);
                      play = false;
                    }
                  },
                  child: Text(
                    board[i],
                    style: textStyle(50),
                  ),
                ),
              ),
            ),
          ),
          // the text to show what character the player is
          Expanded(
            flex: 0,
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
    );
  }
}
