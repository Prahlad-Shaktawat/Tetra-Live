import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/utils/img.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              //natashauserid
              _natashadp(context),

              //homescreen
              _homescreen(context),

              //myaccountpage
              _myaccount(context),

              //livepage
              _live(context),

              //MyWallets
              _myWallets(context),

              //GiftReceived
              _giftReceived(context),

              //myorderspage
              _myorders(context),
              Divider(color: AppColors.greyDark),

              //feedbackpage
              _feedback(context),

              //settings
              _setting(context),

              Divider(color: AppColors.greyDark),
              //LogOut
              _logOut(context),
            ],
          ),
        ),
      ),
    );
  }

  //natashauserid
  _natashadp(BuildContext context) {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      currentAccountPicture:
          CircleAvatar(backgroundImage: AssetImage(Imag.image_dp_img)),
      accountName: Text('Natasha',
          style: TextStyle(
              color: AppColors.deepWhite,
              fontSize: Common.displayWidth(context) * 0.05)),
      accountEmail: Text('natasha@gmail.com ',
          style: TextStyle(color: AppColors.lightWhite)),
    );
  }

  //homescreen
  _homescreen(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.home,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('Home', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.homeScreen);
      },
    );
  }

  //myaccountpage
  _myaccount(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('My Account', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.myAccount);
      },
    );
  }

  //livepage
  _live(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.live_tv,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('Live', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.live);
      },
    );
  }

  //MyWallets
  _myWallets(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_balance_wallet,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('My Wallets', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.paymentScreen);
      },
    );
  }

  //GiftReceived
  _giftReceived(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.card_giftcard,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('Gift Received', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.myWalletScreen);
      },
    );
  }

  //myorderspage
  _myorders(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.shopping_basket,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('My Orders', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.myWalletScreen1);
      },
    );
  }

  //feedbackpage
  _feedback(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.feedback,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('Feedback', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.feedback);
      },
    );
  }

  //settings
  _setting(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.settings,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('Settings', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, Routes.settings);
      },
    );
  }

  //LogOut
  _logOut(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.exit_to_app,
          size: Common.displayHeight(context) * 0.04,
          color: AppColors.deepBlack),
      title: Text('LogOut', style: _textstyle(context)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.logout);
      },
    );
  }

  _textstyle(BuildContext context) {
    return TextStyle(
      fontSize: Common.displayWidth(context) * 0.045,
    );
  }
}
