import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  Color _bg = const Color.fromRGBO(84, 196, 136, 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(5, 5),
                          blurRadius: 1.0,
                        ),
                      ],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Spacer(),
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
