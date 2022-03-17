import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/providerclass.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  FocusNode email = new FocusNode();
  FocusNode number = new FocusNode();

  @override
  Widget build(BuildContext context) {
    Provider.of<Counter>(context, listen: false);
    var appbar = CustomAppBar(
        titleText: 'Payment',
        isMenuButton: false,
        isBackButton: true,
        isCartButton: false,
        isNotificationButton: false,
        isHelp: false);

    return Scaffold(
      appBar: appbar,
      body: Container(
        height: Common.displayHeight(context) * 1,
        width: Common.displayWidth(context) * 1,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
            Consumer<Counter>(
              builder: (context, modal, child) {
                return _paymentDetails(modal);
              },
            ),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.07),

            _contactDetails(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.05),

            //PaymentMethods
            _paymentMethods(),
          ],
        ),
      ),
    );
  }

  //PaymentDetails
  _paymentDetails(i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constant.paymentDetails,
            style: TextStyle(
              color: AppColors.deepBlack,
              fontWeight: FontWeight.w600,
              fontSize: Common.displayWidth(context) * 0.05,
            ),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constant.magicalBeats,
                style: TextStyle(
                  color: AppColors.deepBlack,
                  fontSize: Common.displayWidth(context) * 0.05,
                ),
              ),
              Text(
                Constant.paymentTicket,
                style: TextStyle(
                  color: AppColors.deepBlack,
                  fontSize: Common.displayWidth(context) * 0.05,
                ),
              ),
            ],
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: Common.displayHeight(context) * 0.03,
              width: Common.displayWidth(context) * 0.2,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: AppColors.greyDark),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Icon(
                        Icons.remove,
                        color: AppColors.deepBlack,
                      ),
                      onTap: () => i.ticketDecrement()),
                  Text(i.ticketCounter.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  InkWell(
                    child: Icon(
                      Icons.add,
                      color: AppColors.deepBlack,
                    ),
                    onTap: () => i.ticketIncrement(),
                  ),
                ],
              ),
            ),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.03),
          Divider(
            color: AppColors.deepBlack,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constant.totalTitle,
                style: TextStyle(
                  color: AppColors.deepBlack,
                  fontSize: Common.displayWidth(context) * 0.05,
                ),
              ),
              Text(
                Constant.totalPrice,
                style: TextStyle(
                  color: AppColors.deepBlack,
                  fontSize: Common.displayWidth(context) * 0.05,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //ContactDetails
  _contactDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constant.contactDetailsTitle,
            style: TextStyle(
              color: AppColors.deepBlack,
              fontWeight: FontWeight.w600,
              fontSize: Common.displayWidth(context) * 0.05,
            ),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
          Text(
            Constant.contactDetails,
            style: TextStyle(
              color: AppColors.deepBlack,
              fontSize: Common.displayWidth(context) * 0.038,
            ),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.04),
          Column(
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                focusNode: email,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(number),
                cursorColor: AppColors.greyDark,
                decoration: InputDecoration(
                  hintText: Constant.contactDetailsEmail,
                  helperStyle: TextStyle(color: AppColors.greyDark),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                  focusedBorder: _outLineBorder,
                  errorBorder: _outLineBorder,
                  enabledBorder: _outLineBorder,
                ),
              ),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
              TextField(
                keyboardType: TextInputType.number,
                focusNode: number,
                cursorColor: AppColors.greyDark,
                decoration: InputDecoration(
                  hintText: Constant.contactDetailsNumber,
                  helperStyle: TextStyle(color: AppColors.greyDark),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                  focusedBorder: _outLineBorder,
                  errorBorder: _outLineBorder,
                  enabledBorder: _outLineBorder,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  var _outLineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: AppColors.greyDark,
      width: 1.0,
    ),
  );

  //PaymentMethods
  _paymentMethods() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constant.paymentMethodsTitle,
            style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.045,
                fontWeight: FontWeight.w700),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
          ExpansionTile(
            title: Text(
              'UPI',
              style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.05,
                color: AppColors.deepBlack,
              ),
            ),
            childrenPadding: EdgeInsets.only(bottom: 20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.paymentScreen1);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.deepWhite,
                      backgroundImage: AssetImage(Imag.paytmImg),
                      radius: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.paymentScreen1);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.deepWhite,
                      backgroundImage: AssetImage(Imag.googlePayImg),
                      radius: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.paymentScreen1);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.deepWhite,
                      backgroundImage: AssetImage(Imag.phonePayImg),
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.deepBlack,
              size: Common.displayHeight(context) * 0.04,
            ),
            title: Text(
              'NETBANKING',
              style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.05,
                color: AppColors.deepBlack,
              ),
            ),
            childrenPadding: EdgeInsets.only(bottom: 5),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.paymentScreen2);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.deepWhite,
                      backgroundImage: AssetImage(Imag.barodaBankImg),
                      radius: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.paymentScreen2);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.deepWhite,
                      backgroundImage: AssetImage(Imag.sbiImg),
                      radius: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.paymentScreen2);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.deepWhite,
                      backgroundImage: AssetImage(Imag.iciciImg),
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.deepBlack,
              size: Common.displayHeight(context) * 0.04,
            ),
            title: Text(
              'WALLETS',
              style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.05,
                color: AppColors.deepBlack,
              ),
            ),
            childrenPadding: EdgeInsets.only(bottom: 5),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.deepWhite,
                    backgroundImage: AssetImage(Imag.paytmWalletImg),
                    radius: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.deepWhite,
                    backgroundImage: AssetImage(Imag.googlePayImg),
                    radius: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.deepWhite,
                    backgroundImage: AssetImage(Imag.phonePayImg),
                    radius: 30,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<dynamic> upiList = [
  Imag.paytmImg,
  Imag.googlePayImg,
  Imag.phonePayImg,
];

List<dynamic> netBankingList = [
  {
    'IciciBank': Imag.iciciImg,
  },
  {
    'SbiBank': Imag.sbiImg,
  },
  {
    'BankOfBaroda': Imag.barodaBankImg,
  },
];

List<dynamic> walletsList = [
  {
    'PaytmWallet': Imag.paytmWalletImg,
  },
  {
    'PhonePayWallet': Imag.phonePayImg,
  },
];
