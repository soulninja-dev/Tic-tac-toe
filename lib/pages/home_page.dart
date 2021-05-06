import 'package:flutter/material.dart';
import 'package:tictactoe/pages/game_page.dart';
import 'package:tictactoe/widgets/enter_username.dart';
import '../constants.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  // variables
  static const changeButton = false;

  BorderRadius _br = const BorderRadius.all(Radius.circular(25.0));

  // build method
  @override
  Widget build(BuildContext context) {
    // scaffold will have a Stack with children and spacers between.
    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          // safe area will omit the stuff like notch etc
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 22.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                      fontSize: 55,
                      color: textColor,
                      shadows: [
                        Shadow(
                          color: Colors.white10,
                          offset: Offset(5, 5),
                          blurRadius: 1.0,
                        ),
                      ],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: EnterUsername(br: _br),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GamePage(),
                            ),
                          );
                        },
                        child: Text("Play Now"),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
