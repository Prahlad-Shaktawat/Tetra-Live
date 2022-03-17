import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? titleText;
  bool isMenuButton;
  bool isBackButton;
  bool? isNotificationButton;
  bool? isCartButton;
  bool? isHelp;

  CustomAppBar({
    this.titleText,
    required this.isMenuButton,
    required this.isBackButton,
    this.isCartButton,
    this.isNotificationButton,
    this.isHelp,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      backgroundColor: AppColors.deepWhite,
      elevation: 1,
      centerTitle: true,
      leading: isMenuButton
          ? IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: AppColors.deepBlack),
            )
          : isBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.deepBlack),
                )
              : SizedBox(),
      title: Text(
        titleText!,
        style: TextStyle(
            color: AppColors.deepBlack,
            fontSize: Common.displayWidth(context) * 0.05),
      ),
      actions: [
        isCartButton!
            ? IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.shoppingCart);
                },
                icon: Icon(Icons.shopping_cart_outlined,
                    color: AppColors.deepBlack),
              )
            : SizedBox(),
        isNotificationButton!
            ? IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notification);
                },
                icon: Icon(
                  Icons.notifications_none,
                  color: AppColors.deepBlack,
                ),
              )
            : SizedBox(),
        isHelp!
            ? IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.help);
                },
                icon: Text(
                  'Help',
                  style: TextStyle(color: AppColors.deepBlack),
                ),
              )
            : SizedBox(),
      ],
    ));
  }

  @override
  Size get preferredSize => Size(1000, 56);
}
