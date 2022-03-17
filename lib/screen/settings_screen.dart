import 'package:flutter/material.dart';
import 'package:tetralive/widget/customappbar.dart';

class Settings_Screen extends StatefulWidget {
  @override
  _Settings_ScreenState createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Settings',
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
