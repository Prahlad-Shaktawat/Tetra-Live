import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';

import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class Verify_otp extends StatefulWidget {
  @override
  _Verify_otpState createState() => _Verify_otpState();
}

class _Verify_otpState extends State<Verify_otp> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextFiled({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  var _formKey = new GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Verify OTP',
      isBackButton: true,
      isMenuButton: false,
      isCartButton: false,
      isNotificationButton: false,
      isHelp: false,
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.02),

                //verifywithotpline
                _verifywithotpline(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.02),

                //senttoline
                _senttoline(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.015),

                //sendbox
                _sendbox(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.015),

                //autocapture
                _autocapture(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.03),

                //resendotpline
                _resendotpline(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.03),

                //verifybtn
                _verifybtn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //verifywithotpline
  _verifywithotpline() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        Constant.verifyWithOtp,
        style: TextStyle(
            fontSize: Common.displayWidth(context) * 0.05,
            color: AppColors.primaryColor),
      ),
    );
  }

  //senttoline
  _senttoline() {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          Constant.sendToLine,
          style: TextStyle(
            fontSize: Common.displayWidth(context) * 0.05,
            color: AppColors.greyDark,
          ),
        ));
  }

  //sendbox
  _sendbox() {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.10,
          child: TextFormField(
            textAlign: TextAlign.center,
            obscureText: true,
            autofocus: true,
            onChanged: (value) {
              nextFiled(value: value, focusNode: pin2FocusNode);
            },
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
            ),
          ),
        ),
        SizedBox(width: 4),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.10,
          child: TextFormField(
            textAlign: TextAlign.center,
            onChanged: (value) {
              nextFiled(value: value, focusNode: pin3FocusNode);
            },
            style: TextStyle(fontSize: 24),
            obscureText: true,
            autofocus: true,
            focusNode: pin2FocusNode,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
            ),
          ),
        ),
        SizedBox(width: 4),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.10,
          child: TextFormField(
            textAlign: TextAlign.center,
            autofocus: true,
            obscureText: true,
            onChanged: (value) {
              nextFiled(value: value, focusNode: pin4FocusNode);
            },
            focusNode: pin3FocusNode,
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
            ),
          ),
        ),
        SizedBox(width: 4),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.10,
          child: TextFormField(
            textAlign: TextAlign.center,
            onChanged: (value) {
              pin4FocusNode.unfocus();
            },
            autofocus: true,
            obscureText: true,
            focusNode: pin4FocusNode,
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              )),
            ),
          ),
        ),
      ],
    );
  }

  //autocapture
  _autocapture() {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          Constant.autoLine,
          style: TextStyle(
            fontSize: Common.displayWidth(context) * 0.03,
            color: AppColors.greyDark,
          ),
        ));
  }

  //resendotpline
  _resendotpline() {
    return Row(
      children: [
        Text(Constant.resendOtpLine,
            style: TextStyle(fontSize: Common.displayWidth(context) * 0.04)),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Text(Constant.resendOtpButton,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: Common.displayWidth(context) * 0.045,
                  )),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 30.0, end: 00),
              duration: Duration(seconds: 30),
              builder: (context, value, child) => Text(
                " (${value!})",
                style: TextStyle(
                  fontSize: Common.displayWidth(context) * 0.045,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  //verifybtn
  _verifybtn() {
    return MaterialButton(
      onPressed: () {
        FormState? formState = _formKey.currentState;
        if (!formState!.validate()) {
        } else {
          Navigator.pushNamed(context, Routes.createNewPassword);
        }
      },
      color: AppColors.primaryColor,
      height: MediaQuery.of(context).size.height * 0.06,
      minWidth: MediaQuery.of(context).size.width * 1,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        Constant.verifyButton,
        style: TextStyle(
            fontSize: Common.displayWidth(context) * 0.05,
            color: AppColors.deepWhite),
      ),
    );
  }
}
