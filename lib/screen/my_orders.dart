import 'package:flutter/material.dart';
import 'package:tetralive/widget/customappbar.dart';

class My_Orders extends StatefulWidget {
  @override
  _My_OrdersState createState() => _My_OrdersState();
}

class _My_OrdersState extends State<My_Orders> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'My Orders',
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
