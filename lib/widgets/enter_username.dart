import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';

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
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: _br,
        ),
        labelText: "Username",
        labelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.white54,
          fontFamily: "Poppins",
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
