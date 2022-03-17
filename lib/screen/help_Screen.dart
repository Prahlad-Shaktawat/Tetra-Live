import 'package:flutter/material.dart';
import 'package:tetralive/widget/customappbar.dart';

class Help_Screen extends StatefulWidget {
  @override
  _Help_ScreenState createState() => _Help_ScreenState();
}

class _Help_ScreenState extends State<Help_Screen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Help',
      isMenuButton: false,
      isBackButton: true,
      isNotificationButton: false,
      isCartButton: false,
      isHelp: false,
    );

    return Scaffold(
      appBar: appbar,
    );
  }
}
