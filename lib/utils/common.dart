import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common {
  static sizedBoxHeight(double height) {
    return SizedBox(
      height: height,
    );
  }

  static sizedBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  static displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  static displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  //Show Dialog Popup
  static Future<void> showDialogs(BuildContext context, String message) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: Text('Alert',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  content: Text(message),
                  actions: <Widget>[
                    Center(
                      child: MaterialButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                )
              : AlertDialog(
                  title: Text('Alert',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  content: Text(message),
                  actions: <Widget>[
                    Center(
                      child: MaterialButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                );
        });
  }

  static removeKeyBoardFocus(BuildContext context) {
    return FocusScope.of(context).unfocus();
  }
}
