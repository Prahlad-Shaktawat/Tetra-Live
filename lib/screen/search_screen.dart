import 'package:flutter/material.dart';
import 'package:tetralive/utils/theme.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        title: TextFormField(
          maxLength: 60,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            hintText: "Search....",
            border: InputBorder.none,
            counterText: "",
          ),
        ),
      ),
    ));
  }
}
