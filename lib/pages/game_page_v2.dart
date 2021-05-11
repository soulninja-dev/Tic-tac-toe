import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/constants.dart';

class GamePagev2 extends StatefulWidget {
  const GamePagev2({Key? key}) : super(key: key);

  @override
  _GamePagev2State createState() => _GamePagev2State();
}

class _GamePagev2State extends State<GamePagev2> {

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
                  onPressed: () {},
                  child: Text(
                    "",
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
