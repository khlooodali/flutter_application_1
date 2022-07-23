import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function onPostivePressed;
  final Function onNegativePressed;
  final double circularBorderRadius;
  CustomAlertDialog({
    required this.title,
    required this.message,
    required this.circularBorderRadius,
    required this.bgColor,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.onPostivePressed,
    required this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        if (positiveBtnText != null)
          FlatButton(
            onPressed: () {
              onPostivePressed();
            },
            child: Text(positiveBtnText),
            textColor: Theme.of(context).accentColor,
          ),

        if (negativeBtnText != null)
          FlatButton(
            onPressed: () {
              onNegativePressed();
            },
            child: Text(
              negativeBtnText,
            ),
            textColor: Theme.of(context).accentColor,
          ),

        // ignore: unnecessary_null_comparison
      ],
    );
  }
}
