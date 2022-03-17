import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';

import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/utils/validation.dart';
import 'package:tetralive/widget/customappbar.dart';

class Verify_email extends StatefulWidget {
  @override
  _Verify_emailState createState() => _Verify_emailState();
}

class _Verify_emailState extends State<Verify_email> {
  var _formKey = new GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Verify email',
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

                //verifypagetitle
                _verifypagetitle(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.02),

                //emailtextbox
                _emailtextbox(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.06),

                //getotpbtn
                _getotpbtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //verifypagetitle
  _verifypagetitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(Constant.verifyPageTitle,
          style: TextStyle(
              fontSize: Common.displayWidth(context) * 0.04,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor)),
    );
  }

  //emailtextbox
  _emailtextbox() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLength: 31,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter user id';
        } else if (!Validator.isValidEmail(value.trim())) {
          return 'Please enter valid email';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: Constant.verifyTextBox,
        border: InputBorder.none,
        errorBorder: _underlineborder,
        focusedBorder: _underlineborder,
        focusedErrorBorder: _underlineborder,
        enabledBorder: _underlineborder,
        counterText: '',
      ),
    );
  }

  //outlineborder
  var _underlineborder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greyDark,
      width: 2.0,
    ),
  );

  //getotpbtn
  _getotpbtn() {
    return MaterialButton(
      onPressed: () {
        FormState? formState = _formKey.currentState;
        if (!formState!.validate()) {
        } else {
          Navigator.pushNamed(context, Routes.verifyOtp);
        }
      },
      color: Color(0xff002651),
      height: MediaQuery.of(context).size.height * 0.06,
      minWidth: MediaQuery.of(context).size.width * 1,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        Constant.getOtpButton,
        style: TextStyle(
            color: AppColors.deepWhite,
            fontSize: Common.displayWidth(context) * 0.05),
      ),
    );
  }
}
