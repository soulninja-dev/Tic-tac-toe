import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  Color _bg = const Color.fromRGBO(84, 196, 136, 1.0);
  BorderRadius _br = const BorderRadius.all(Radius.circular(25.0));
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
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 22.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                      fontSize: 60,
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
                  TextFormField(
                    showCursor: true,
                    cursorColor: Colors.black,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    cursorHeight: 28,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: _br,
                        borderSide: new BorderSide(),
                      ),
                      hintText: "Enter name",
                      labelText: "Username",
                      hintStyle: TextStyle(
                        fontSize: 17,
                        fontFamily: "KiwiMaru",
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontFamily: "KiwiMaru",
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
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
