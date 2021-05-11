import 'package:flutter/material.dart';
import 'package:tictactoe/pages/game_page.dart';

import 'pages/home_page.dart';

class Functions {
  static void reset() {
    plays = 0;
    text = [
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
  }

  static String checkWinner(winner) {
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

  static bool winCheck(List<String> text) {
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
}
