import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';

import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/utils/validation.dart';
import 'package:tetralive/widget/customappbar.dart';
import 'verify_email.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode email = new FocusNode();
  FocusNode password = new FocusNode();

  bool _isChecked = false;
  bool isLoading = false;

  var _formKey = GlobalKey<FormState>();
  var __scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Login',
      isMenuButton: false,
      isBackButton: false,
      isCartButton: false,
      isNotificationButton: false,
      isHelp: false,
    );

    return Scaffold(
      key: __scaffoldKey,
      appBar: appbar,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.01),

                //loginPageTitle
                _loginPageTitle(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.03),

                //emailTextBox
                _emailTextBox(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.03),

                //passwordtextbox
                _passwordtextbox(),

                //remembermeandforgotpassword
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.02),
                _remembermeandforgotpassword(),

                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.04),
                //loginbtn
                _loginbtn(),

                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.04),

                //taglineotherappregister
                _taglineotherappregister(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.02),

                //newaccountwithgmailfb
                _newaccountwithgmailfb(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.04),

                //newaccount
                _newaccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //loginPageTitle
  _loginPageTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(Constant.loginPageTitle,
          style: TextStyle(
              fontSize: Common.displayWidth(context) * 0.06,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor)),
    );
  }

  //emailTextBox
  _emailTextBox() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: email,
      onEditingComplete: () => FocusScope.of(context).requestFocus(password),
      maxLength: 30,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter email.';
        } else if (!Validator.isValidEmail(value.trim())) {
          return 'Please enter valid email';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: Constant.emailTextBox,
        border: InputBorder.none,
        errorBorder: _underLineBorder,
        focusedBorder: _underLineBorder,
        focusedErrorBorder: _underLineBorder,
        enabledBorder: _underLineBorder,
        counterText: '',
      ),
    );
  }

  //usernametextbox
  _passwordtextbox() {
    return TextFormField(
      obscureText: true,
      focusNode: password,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 30,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Enter password';
        } else if (value.trim().length < 8) {
          return 'Password should be minimum 8 character';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.visibility),
        hintText: Constant.passwordTextBox,
        border: InputBorder.none,
        errorBorder: _underLineBorder,
        focusedBorder: _underLineBorder,
        focusedErrorBorder: _underLineBorder,
        enabledBorder: _underLineBorder,
        counterText: '',
      ),
    );
  }

  //outlineborder
  var _underLineBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greyDark,
      width: 2.0,
    ),
  );

  //remembermeandforgotpassword
  _remembermeandforgotpassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              tristate: false,
              visualDensity: VisualDensity.compact,
              value: _isChecked,
              checkColor: AppColors.deepWhite,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            Text(Constant.rememberMeText,
                style: TextStyle(color: AppColors.greyDark)),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Verify_email()));
          },
          child: Text(Constant.forgotPasswordTextButton,
              style: TextStyle(color: AppColors.greyDark)),
        ),
      ],
    );
  }

  //loginbtn
  _loginbtn() {
    return MaterialButton(
        color: AppColors.primaryColor,
        onPressed: () {
          Common.removeKeyBoardFocus(context);
          FormState? formState = _formKey.currentState;
          if (!formState!.validate()) {
            return null;
          } else {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          }
        },
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        height: MediaQuery.of(context).size.height * 0.06,
        minWidth: MediaQuery.of(context).size.width * 1,
        child: Text(Constant.loginButton,
            style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.05,
                color: AppColors.deepWhite)));
  }

  //taglineotherappregister
  _taglineotherappregister() {
    return Align(
      child: Text(
        Constant.otherSocial,
        style: TextStyle(
            fontSize: Common.displayWidth(context) * 0.04,
            color: AppColors.greyDark.withOpacity(0.7)),
      ),
    );
  }

  //newaccountwithgmailfb
  _newaccountwithgmailfb() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Icon(
            FontAwesomeIcons.google,
            color: AppColors.deepRed,
            size: 40,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 30),
        CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Icon(
            FontAwesomeIcons.facebook,
            size: 40,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  //newaccount
  _newaccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Constant.newAccount,
          style: TextStyle(fontSize: Common.displayWidth(context) * 0.05),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.registerScreen);
          },
          child: Text(
            Constant.registerTxtButton,
            style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.05,
                color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
