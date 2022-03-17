import 'package:flutter/material.dart';
import 'package:tetralive/screen/buytickets.dart';
import 'package:tetralive/screen/chat_room.dart';
import 'package:tetralive/screen/help_Screen.dart';
import 'package:tetralive/screen/helpandfeeback.dart';
import 'package:tetralive/screen/live_screen.dart';
import 'package:tetralive/screen/livenotification.dart';
import 'package:tetralive/screen/my%20cart.dart';
import 'package:tetralive/screen/my_account_screen.dart';
import 'package:tetralive/screen/my_orders.dart';
import 'package:tetralive/screen/redeemscreen.dart';
import 'package:tetralive/screen/search_screen.dart';
import 'package:tetralive/screen/settings_screen.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/widget/drawer.dart';
import 'package:tetralive/widget/home_widgets/home_screen.dart';
import 'package:tetralive/widget/my_wallet_widgets/my_wallet_screen.dart';
import 'package:tetralive/widget/my_wallet_widgets/Payment1.dart';
import 'package:tetralive/widget/my_wallet_widgets/PaymentScreen.dart';
import 'package:tetralive/widget/my_wallet_widgets/my_wallet_screen1.dart';
import 'package:tetralive/widget/my_wallet_widgets/paymentScreen2.dart';
import 'package:tetralive/widget/user_login_widgets/createnewpassword.dart';
import 'package:tetralive/widget/user_login_widgets/login.dart';
import 'package:tetralive/widget/user_login_widgets/register.dart';
import 'package:tetralive/widget/user_login_widgets/verify_email.dart';
import 'package:tetralive/widget/user_login_widgets/verify_otp.dart';
import 'package:provider/provider.dart';

import 'utils/providerclass.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Counter()),
      ],
      child: MaterialApp(
        title: 'tetralive',
        theme: AppTheme.of(context),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          Routes.loginScreen: (BuildContext context) => LoginScreen(),
          Routes.logout: (BuildContext context) => LoginScreen(),
          Routes.registerScreen: (BuildContext context) => Register(),
          Routes.homeScreen: (BuildContext context) => HomeScreen(),
          Routes.searchScreen: (BuildContext context) => SearchScreen(),
          Routes.verifyEmail: (BuildContext context) => Verify_email(),
          Routes.verifyOtp: (BuildContext context) => Verify_otp(),
          Routes.createNewPassword: (_) => Createnew_password(),
          Routes.shoppingCart: (BuildContext context) => My_Cart_Screen(),
          Routes.drawer: (BuildContext context) => MenuDrawer(),
          Routes.myAccount: (BuildContext context) => MyAccount(),
          Routes.live: (BuildContext context) => Live_Screen(),
          Routes.chatRoom: (BuildContext context) => ChatRoom(),
          Routes.myOrders: (BuildContext context) => My_Orders(),
          Routes.feedback: (BuildContext context) => FeedBack(),
          Routes.settings: (BuildContext context) => Settings_Screen(),
          Routes.notification: (BuildContext context) => Live_notification(),
          Routes.help: (BuildContext context) => Help_Screen(),
          Routes.redeem: (BuildContext context) => RedeemScreen(),
          Routes.buyTickets: (BuildContext context) => BuyTickets(),
          Routes.paymentScreen: (BuildContext context) => PaymentScreen(),
          Routes.paymentScreen1: (BuildContext context) => PaymentScreen1(),
          Routes.paymentScreen2: (BuildContext context) => PaymentScreen2(),
          Routes.paymentScreen2: (BuildContext context) => PaymentScreen2(),
          Routes.myWalletScreen: (BuildContext context) => MyWalletScreen(),
          Routes.myWalletScreen1: (BuildContext context) => MyWalletScreen1(),
        },
      ),
    );
  }
}
