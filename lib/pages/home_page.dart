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
                  Material(
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    color: Colors.black,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 130,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Play Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "KiwiMaru",
                          ),
                        ),
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
