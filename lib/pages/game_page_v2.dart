import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';

class GamePagev2 extends StatefulWidget {
  const GamePagev2({Key? key}) : super(key: key);

  @override
  _GamePagev2State createState() => _GamePagev2State();
}

class _GamePagev2State extends State<GamePagev2> {

/*

    game logic:

    home screen:
        - Variables are set. Player chooses if X or O.
        - onClick of play button, Navigator pops to gamePagev2.

    game screen:
        - UI: Grid, You are, Text.
        - Grid's items are text buttons. with default empty text.
        - onClick of a button:
            - await the function calls.
            - set state of board
            - whoIsWinner function is called and saved into a var
                - if board is empty, returns 0.
                - else if any possibility of win (verticals | horizontals | diagonals) = "X", return 1.
                - else if any possibility of win (verticals | horizontals | diagonals) = "O", return 2.
                - else if board is full ( tie breaker ), return 3
                - else return 0
            - call winCheck with the variable saved.
                - switch (whoIsWinner)
                    - 0 -> just break.
                    - 1 -> check who is "X" and call moveToWinner with params: "HUMAN" | "BOT"
                    - 2 -> check who is "O" and call moveToWinner with params: "HUMAN" | "BOT"
                    - 3 -> call moveToWinner with param: "TIE"
            - botPlay is called.
                - generate a random number
                - check if that random number's index is taken on the board, if yes generate again, if not continue.
                - delay 0.2 seconds.
                - setState of botplay
                - call whoIsWinner again and save it into a var
                - call winCheck with the variable saved.


    humanLetter string var -> either "X" or "O"
    botLetter string var -> opposite of humanLetter.

    List<String> humanPlays -> dynamic list with indexes of human plays.
    List<String> botPlays -> dynamic list with indexes of bot plays.
    List<String> board -> list with 9 elements default "" changes to "X" or "O" after each play.

    void clicked(int index)
    int whoIsWinner()
    void winCheck(int resultWhoIsWinner)
    void botPlay()

 */

  String humanLetter = "X";
  String botLetter = "O";
  // VARIABLES
  List<String> humanPlays = [];
  List<String> botPlays = [];
  List<String> board = ["","","","","","","","",""];

  // FUNCTIONS

  void clicked (int index) async {

    // set state of the board
    setState(() {
      humanPlays.add(index.toString());
      board[index] = humanLetter;
      print(humanPlays);
      print(board);
    });
    int result = await whoIsWinner();
  }

  whoIsWinner() async{
      if(!board.contains("X") && !board.contains("O")) return 0;
      else return 1;
  }

  Future<void> winCheck(int result) async{
    print("haha");
  }

  Future<void> botPlay() async {
    print("bot played");
  }

  textStyle(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: "Poppins",
      color: white,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        leading: Text(""),
        title: Text(
          "Tic Tac Toe",
          style:textStyle(25),
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
                    if(board[i]=="")
                    clicked(i);
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
