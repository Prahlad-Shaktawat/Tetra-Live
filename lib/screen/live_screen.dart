import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class Live_Screen extends StatefulWidget {
  @override
  _Live_ScreenState createState() => _Live_ScreenState();
}

class _Live_ScreenState extends State<Live_Screen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Live',
      isBackButton: true,
      isMenuButton: false,
      isCartButton: false,
      isNotificationButton: true,
      isHelp: false,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: ListView(
          shrinkWrap: true,
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),

            _livepic(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
            Divider(height: 3, color: AppColors.deepBlack),

            //livecomment
            _livecomment(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.vertical),
        child: _textbox(),
      ),
    );
  }

  //livepic
  _livepic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: Common.displayHeight(context) * 0.35,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(Imag.singer_pic),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.chatRoom);
                          },
                          child: Text(
                            ' LIVE ',
                            style: TextStyle(
                                color: AppColors.deepWhite,
                                backgroundColor: AppColors.deepRed),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text('3K',
                                  style: TextStyle(color: AppColors.deepWhite)),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(Icons.visibility,
                                    size: Common.displayWidth(context) * 0.04,
                                    color: AppColors.deepWhite)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  Constant.nameAmulya,
                                  style: TextStyle(color: AppColors.deepAmber),
                                ),
                                Text(
                                  Constant.amulyaComment,
                                  style: TextStyle(
                                    color: AppColors.deepWhite,
                                  ),
                                ),
                              ],
                            ),
                            Common.sizedBoxHeight(
                                MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                Text(
                                  Constant.nameVarsha,
                                  style: TextStyle(color: AppColors.deepAmber),
                                ),
                                Text(
                                  Constant.varshaComment,
                                  style: TextStyle(
                                    color: AppColors.deepWhite,
                                  ),
                                ),
                              ],
                            ),
                            Common.sizedBoxHeight(
                                MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                Text(Constant.nameHarini,
                                    style:
                                        TextStyle(color: AppColors.deepAmber)),
                                Text(
                                  Constant.hariniComment,
                                  style: TextStyle(
                                    color: AppColors.deepWhite,
                                  ),
                                ),
                              ],
                            ),
                            Common.sizedBoxHeight(
                                MediaQuery.of(context).size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(Constant.nameMadhav,
                                        style: TextStyle(
                                            color: AppColors.deepAmber)),
                                    Text(
                                      Constant.madhavComment,
                                      style: TextStyle(
                                        color: AppColors.deepWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                      icon: Icon(Icons.fullscreen), onPressed: () {})),
            ],
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: Constant.streamingNow,
                  style: TextStyle(
                    color: AppColors.greyDark,
                  )),
              TextSpan(
                  text: Constant.streamerName,
                  style: TextStyle(
                    color: AppColors.deepBlack,
                    fontWeight: FontWeight.w500,
                  ))
            ]),
          ),
        ],
      ),
    );
  }

  //livecomment
  _livecomment() {
    return Container(
      height: Common.displayHeight(context) * 0.39,
      child: ListView.builder(
          itemCount: livecomment.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.deepWhite,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(livecomment[i]['Name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Common.displayWidth(context) * 0.04)),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.01),
                      Text(
                        livecomment[i]['Comment'],
                        style: TextStyle(
                          fontSize: Common.displayWidth(context) * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  //textbox
  _textbox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.send),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          hintText: 'Send a message',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          focusedBorder: _underlineInputBorder,
          enabledBorder: _underlineInputBorder,
        ),
      ),
    );
  }

  var _underlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.greyDark,
        width: 1.5,
      ));
}

List<dynamic> livecomment = [
  {
    'Name': 'Surya',
    'Comment': 'Lorem ipsum is simply dummy text',
  },
  {
    'Name': 'Akash',
    'Comment': 'Lorem ipsum is simply dummy text',
  },
  {
    'Name': 'Gaytri',
    'Comment': 'Lorem ipsum is ❤❤❤',
  },
  {
    'Name': 'Akash',
    'Comment': 'Lorem ipsum is simply dummy text',
  },
  {
    'Name': 'Gaytri',
    'Comment': 'Lorem ipsum is ❤❤❤',
  },
];
