import 'package:tictactoe/pages/game_page_v2.dart';

class Functions {
  static void reset() {
    play = true;
    isGameOver = false;
    humanLetter = "X";
    botLetter = "O";
    randomIndex = -1;
    humanPlays = [];
    botPlays = [];
    board = ["", "", "", "", "", "", "", "", ""];
  }
}