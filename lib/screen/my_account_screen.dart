import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';
import 'dart:io';
import 'natashapage.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  var captureImage;

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
        height: Common.displayHeight(context) * 1,
        width: Common.displayWidth(context) * 1,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.05),

            //usernamedp
            _userprofile(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.07),

            //fansandprofession
            _fansandprofession(),
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
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: captureImage == null
                    ? AssetImage(Imag.image_dp_img) as ImageProvider
                    : FileImage(File(captureImage.path)),
                radius: 45,
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.primaryColor,
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => _bottomsheet(context));
                      },
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.deepWhite,
                        size: 20,
                      )),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Constant.username,
                      style: TextStyle(
                          fontSize: Common.displayWidth(context) * 0.05,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text(
                    Constant.userAbout,
                    style: TextStyle(color: AppColors.greyDark),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bottomsheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
            Text(
              Constant.profilePhoto,
              style: TextStyle(fontSize: Common.displayWidth(context) * 0.05),
            ),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      takePhoto(ImageSource.camera);
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 25,
                            child: Icon(Icons.camera_alt,
                                size: Common.displayHeight(context) * 0.04,
                                color: AppColors.deepWhite)),
                        Common.sizedBoxHeight(
                            MediaQuery.of(context).size.height * 0.01),
                        Text(Constant.camera),
                      ],
                    )),
                Common.sizedBoxWidth(MediaQuery.of(context).size.width * 0.07),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.cancel,
                            size: Common.displayHeight(context) * 0.04,
                            color: AppColors.deepRed),
                        Common.sizedBoxHeight(
                            MediaQuery.of(context).size.height * 0.01),
                        Text(Constant.cancel),
                      ],
                    )),
                Common.sizedBoxWidth(MediaQuery.of(context).size.width * 0.07),
                InkWell(
                  onTap: () {
                    takePhoto(ImageSource.gallery);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Color(0xff002651),
                          radius: 25,
                          child: Icon(Icons.photo,
                              size: Common.displayHeight(context) * 0.04,
                              color: AppColors.deepWhite)),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.01),
                      Text(Constant.gallery),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      captureImage = image;
      Navigator.pop(context);
    });
  }

  //fansandprofession
  _fansandprofession() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constant.genre, style: TextStyle(color: AppColors.greyDark)),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
              Text(Constant.rock, style: _textstyle()),
            ],
          ),
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
                      color: Color(0xff002651))),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: Common.displayWidth(context) * 0.005,
                  color: AppColors.primaryColor,
                ),
              )),
          MaterialButton(
              minWidth: Common.displayWidth(context) * 0.40,
              height: Common.displayHeight(context) * 0.06,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Natasha_screen(
                              profile: captureImage,
                            )));
              },
              child: Text(Constant.subscribeBtn,
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
                  text: Constant.electrifiedHorse,
                  style: TextStyle(
                    color: AppColors.deepBlack,
                  )),
              TextSpan(
                  text: Constant.musicRock,
                  style: TextStyle(
                    color: AppColors.greyDark,
                  )),
            ]),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: Constant.liveOn,
                  style: TextStyle(
                    color: AppColors.greyDark,
                  )),
              TextSpan(
                  text: Constant.liveDate,
                  style: TextStyle(
                    color: AppColors.deepBlack,
                  )),
            ]),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.005),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: Constant.artists,
                  style: TextStyle(
                    color: AppColors.deepBlack,
                  )),
              TextSpan(
                  text: Constant.artistsName,
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
      child: Column(
        children: [
          Image.asset(Imag.image_music_img),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("20"),
                  Common.sizedBoxWidth(
                      MediaQuery.of(context).size.width * 0.01),
                  Icon(CupertinoIcons.chat_bubble),
                ],
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.bell),
                  Common.sizedBoxWidth(
                      MediaQuery.of(context).size.width * 0.03),
                  Icon(Icons.share_outlined),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
