import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WinnerPage extends StatelessWidget {
  String winner;
  WinnerPage(String winner) {
    this.winner = winner;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$winner won"),
    );
  }
}
