import 'package:flutter/material.dart';
import 'package:tictactor/constants.dart';

class EnterUsername extends StatelessWidget {
  const EnterUsername({
    Key key,
    @required BorderRadius br,
  })  : _br = br,
        super(key: key);

  final BorderRadius _br;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      cursorColor: textColor,
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
          color: Colors.white30,
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.white54,
          fontFamily: "KiwiMaru",
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: textColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white60),
        ),
      ),
    );
  }
}
