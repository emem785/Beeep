
import 'package:beep/core/utils/StyleGuide.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isBrown;

  const CommonButton({Key key, this.onPressed, this.text, this.isBrown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: RaisedButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: isBrown ? Colors.brown : lightGreen)),
            color: isBrown ? Colors.white : lightGreen,
            elevation: 0.0,
            child: Text(
              text,
              style: TextStyle(color: isBrown ? Colors.brown : Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}