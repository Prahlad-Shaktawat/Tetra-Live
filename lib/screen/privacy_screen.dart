import 'package:flutter/material.dart';
import 'package:tetralive/widget/customappbar.dart';

class Privacy_screen extends StatefulWidget {
  @override
  _Privacy_screenState createState() => _Privacy_screenState();
}

class _Privacy_screenState extends State<Privacy_screen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Privacy',
      isBackButton: true,
      isMenuButton: false,
      isCartButton: false,
      isNotificationButton: false,
      isHelp: false,
    );

    return Scaffold(
      appBar: appbar,
    );
  }
}
