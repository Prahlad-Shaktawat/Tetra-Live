import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

// ignore: must_be_immutable
class Natasha_screen extends StatefulWidget {
  var profile;

  Natasha_screen({this.profile});

  @override
  _Natasha_screenState createState() => _Natasha_screenState();
}

class _Natasha_screenState extends State<Natasha_screen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Natasha Taylor',
      isBackButton: true,
      isMenuButton: false,
      isCartButton: false,
      isNotificationButton: false,
      isHelp: false,
    );

    return Scaffold(
      appBar: appbar,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.05),

            //usernamedp
            _userprofile(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.07),

            //userprofession
            _userprofession(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.05),

            //fansandfollowbutton
            _fansandfollowbutton(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.07),

            //musicpartypic
            _musicartists(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),

            //partypic
            _musicandpic(),
          ],
        ),
      ),
    );
  }

  //usernamedp
  _userprofile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: widget.profile == null
                ? AssetImage('asset/natashapic.jpg') as ImageProvider
                : FileImage(File(widget.profile.path)),
            radius: 45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Constant.username,
                      style: TextStyle(
                          fontSize: Common.displayWidth(context) * 0.06,
                          fontWeight: FontWeight.w600)),
                  Common.sizedBoxHeight(
                      MediaQuery.of(context).size.height * 0.01),
                  Text(
                    Constant.userAbout,
                    style: TextStyle(
                      color: AppColors.greyDark,
                      fontSize: Common.displayWidth(context) * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //userprofession
  _userprofession() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constant.location,
                  style: TextStyle(color: AppColors.greyDark)),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
              Text(Constant.locationName, style: _textstyle()),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constant.profession,
                  style: TextStyle(color: AppColors.greyDark)),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
              Text(Constant.professionName, style: _textstyle()),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constant.genre, style: TextStyle(color: AppColors.greyDark)),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
              Text(Constant.rock, style: _textstyle()),
            ],
          ),
        ],
      ),
    );
  }

  //fansandfollowbutton
  _fansandfollowbutton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
              minWidth: Common.displayWidth(context) * 0.40,
              height: Common.displayHeight(context) * 0.06,
              onPressed: () {},
              child: Text(Constant.followBtn,
                  style: TextStyle(
                      fontSize: Common.displayWidth(context) * 0.05,
                      color: AppColors.primaryColor)),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: Common.displayWidth(context) * 0.005,
                  color: AppColors.primaryColor,
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constant.fans, style: TextStyle(color: AppColors.greyDark)),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
              Text(Constant.fansK, style: _textstyle()),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constant.superFan,
                  style: TextStyle(color: AppColors.greyDark)),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
              Text(Constant.superFanK, style: _textstyle()),
            ],
          ),
        ],
      ),
    );
  }

  _textstyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
    );
  }

  //musicartists
  _musicartists() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'ElectrifiedHorse-  ',
                  style: TextStyle(
                    color: AppColors.deepBlack,
                  )),
              TextSpan(
                  text: 'Fusion music and Rock',
                  style: TextStyle(
                    color: AppColors.greyDark,
                  )),
            ]),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Going live on',
                  style: TextStyle(
                    color: AppColors.greyDark,
                  )),
              TextSpan(
                  text: ' 15 Aug | 06:00PM',
                  style: TextStyle(
                    color: AppColors.deepBlack,
                  )),
            ]),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Artists: ',
                  style: TextStyle(
                    color: AppColors.deepBlack,
                  )),
              TextSpan(
                  text: 'Natasha taylor, Monica gazatambibe',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  )),
            ]),
          ),
        ],
      ),
    );
  }

  //musicpartypic
  _musicandpic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Image.asset(Imag.image_music_img),
    );
  }
}
