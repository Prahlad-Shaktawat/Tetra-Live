import 'package:flutter/material.dart';
import 'package:tetralive/screen/termas_conditions.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/utils/validation.dart';
import 'package:tetralive/widget/customappbar.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

FocusNode name = new FocusNode();
FocusNode email = new FocusNode();
FocusNode password = new FocusNode();

bool _isChecked = false;

class _RegisterState extends State<Register> {
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'SignUp',
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
        padding: const EdgeInsets.all(15),
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
                    MediaQuery.of(context).size.height * 0.03),

                //loginpagetitle
                _loginpagetitle(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.03),

                //nametextbox
                _nametextbox(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.03),

                //emailtextbox
                _emailtextbox(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.03),

                //passwordtextbox
                _passwordtextbox(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.02),

                //privacypolicy
                _privacypolicy(),
                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.02),

                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.04),
                //signupbtn
                _signupbtn(),

                Common.sizedBoxHeight(
                    MediaQuery.of(context).size.height * 0.04),
                //oldaccount
                _oldaccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //loginpagetitle
  _loginpagetitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(Constant.registerPageTitle,
          style: TextStyle(
              fontSize: Common.displayWidth(context) * 0.07,
              fontWeight: FontWeight.w500,
              color: Color(0xff002651))),
    );
  }

  //nametextbox
  _nametextbox() {
    return TextFormField(
      focusNode: name,
      keyboardType: TextInputType.name,
      onEditingComplete: () => FocusScope.of(context).requestFocus(email),
      maxLength: 31,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Enter name';
        } else if (value.trim().length > 30) {
          return 'Maximum 30 character';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: Constant.userNameBox,
        border: InputBorder.none,
        errorBorder: _underLineBorder,
        focusedBorder: _underLineBorder,
        focusedErrorBorder: _underLineBorder,
        enabledBorder: _underLineBorder,
        counterText: '',
      ),
    );
  }

  //emailtextbox
  _emailtextbox() {
    return TextFormField(
      focusNode: email,
      keyboardType: TextInputType.emailAddress,
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
        hintText: Constant.registerEmailTextBox,
        border: InputBorder.none,
        errorBorder: _underLineBorder,
        focusedBorder: _underLineBorder,
        focusedErrorBorder: _underLineBorder,
        enabledBorder: _underLineBorder,
        counterText: '',
      ),
    );
  }

  //passwordtextbox
  _passwordtextbox() {
    return TextFormField(
      focusNode: password,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 16,
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
        suffixIcon: Icon(
          Icons.visibility_off,
          color: AppColors.greyDark,
        ),
        hintText: Constant.registerPasswordTextBox,
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

  //privacypolicy
  _privacypolicy() {
    return Row(
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
        Text(Constant.privacyPolicy,
            style: TextStyle(fontSize: Common.displayWidth(context) * 0.04)),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Terms_Conditions()));
          },
          child: Text(Constant.termsConditions,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Common.displayWidth(context) * 0.04,
                color: AppColors.primaryColor,
              )),
        ),
      ],
    );
  }

  //signupbtn
  _signupbtn() {
    return MaterialButton(
      color: AppColors.primaryColor,
      onPressed: () {
        FormState? formState = _formKey.currentState;
        if (!formState!.validate()) {
          return null;
        } else if (!_isChecked) {
          Common.showDialogs(context, 'Please check privacy policy');
        } else {
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
          Common.removeKeyBoardFocus(context);
        }
      },
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      height: MediaQuery.of(context).size.height * 0.06,
      minWidth: MediaQuery.of(context).size.width * 1,
      child: Text(Constant.signUpButton,
          style: TextStyle(
              fontSize: Common.displayWidth(context) * 0.04,
              color: AppColors.deepWhite)),
    );
  }

  //oldaccount
  _oldaccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Constant.alreadyAccount,
            style: TextStyle(
              fontSize: Common.displayWidth(context) * 0.04,
            )),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            Constant.alreadyAccountLoginButton,
            style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.05,
                color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
