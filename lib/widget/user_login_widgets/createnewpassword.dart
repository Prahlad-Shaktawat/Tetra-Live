import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

import 'login.dart';

class Createnew_password extends StatefulWidget {
  @override
  _Createnew_passwordState createState() => _Createnew_passwordState();
}

FocusNode createpassword = new FocusNode();
FocusNode confirm = new FocusNode();

class _Createnew_passwordState extends State<Createnew_password> {
  var _formKey = GlobalKey<FormState>();
  var _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'New password',
      isBackButton: true,
      isMenuButton: false,
      isCartButton: false,
      isNotificationButton: false,
      isHelp: false,
    );
    return Scaffold(
        key: _scaffold,
        appBar: appbar,
        body: Padding(
          padding: EdgeInsets.all(15),
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
                        MediaQuery.of(context).size.height * 0.025),

                    //createnewpasswordtitle
                    _createnewpasswordtitle(),
                    Common.sizedBoxHeight(
                        MediaQuery.of(context).size.height * 0.03),

                    //newpassword
                    _newpassword(),
                    Common.sizedBoxHeight(
                        MediaQuery.of(context).size.height * 0.03),

                    //confirmpassword
                    _confirmpassword(),
                    Common.sizedBoxHeight(
                        MediaQuery.of(context).size.height * 0.07),

                    //passworddonebutton
                    _passworddonebutton(),
                  ]),
            ),
          ),
        ));
  }

  //createnewpasswordtitle
  _createnewpasswordtitle() {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(Constant.createNewPasswordTitle,
            style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.05,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor)));
  }

  //newpassword
  _newpassword() {
    return TextFormField(
      maxLength: 15,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter password.';
        } else if (value.trim().length < 8) {
          return 'password should be minimum 8 character';
        } else {
          return null;
        }
      },
      focusNode: createpassword,
      onEditingComplete: () => FocusScope.of(context).requestFocus(confirm),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: Constant.newPassword,
        border: InputBorder.none,
        enabledBorder: _outlineborder,
        focusedBorder: _outlineborder,
        errorBorder: _outlineborder,
        focusedErrorBorder: _outlineborder,
        counterText: '',
      ),
    );
  }

  //confirmpassword
  _confirmpassword() {
    return TextFormField(
      maxLength: 15,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter password.';
        } else if (value.trim().length < 8) {
          return 'password should be minimum 8 character';
        } else {
          return null;
        }
      },
      focusNode: confirm,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: Constant.confirm,
        border: InputBorder.none,
        enabledBorder: _outlineborder,
        focusedBorder: _outlineborder,
        errorBorder: _outlineborder,
        focusedErrorBorder: _outlineborder,
        counterText: '',
      ),
    );
  }

  //outlineborder
  var _outlineborder = UnderlineInputBorder(
      borderSide: BorderSide(
    color: AppColors.greyDark,
    width: 2.0,
  ));

  //passworddonebutton
  _passworddonebutton() {
    return MaterialButton(
      height: MediaQuery.of(context).size.height * 0.06,
      minWidth: MediaQuery.of(context).size.width * 1,
      color: AppColors.primaryColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: () {
        FormState? formState = _formKey.currentState;
        if (!formState!.validate()) {
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
      child: Text(
        Constant.doneButton,
        style: TextStyle(
            fontSize: Common.displayWidth(context) * 0.05,
            color: AppColors.deepWhite),
      ),
    );
  }
}
