import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
        titleText: "Chat Room",
        isMenuButton: false,
        isBackButton: true,
        isCartButton: false,
        isNotificationButton: true,
        isHelp: false);

    return Scaffold(
      appBar: appbar,
      body: Container(
        height: Common.displayHeight(context) * 1,
        width: Common.displayWidth(context) * 1,
        child: Column(
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),

            //PeopleInTheRoom
            _peopleInTheRoom(),
            Divider(
              color: AppColors.greyDark,
            ),

            //LiveComment
            _liveComment(),
          ],
        ),
      ),
      //TextBox
      bottomSheet: _textBox(),
    );
  }

  //PeopleInTheRoom
  _peopleInTheRoom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(Constant.theChatRoom),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
        Container(
          height: Common.displayHeight(context) * 0.14,
          width: Common.displayWidth(context) * 1,
          child: ListView.builder(
              itemCount: peopleInTheRoom.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(peopleInTheRoom[i]['image']),
                            radius: 40,
                          ),
                          Positioned(
                            top: 7,
                            right: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        peopleInTheRoom[i]['Name'],
                        style: TextStyle(
                            fontSize: Common.displayWidth(context) * 0.05),
                      ),
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }

  //LiveComment
  _liveComment() {
    return Container(
      height: Common.displayHeight(context) * 0.57,
      child: ListView.builder(
          itemCount: liveComment.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
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
                      Text(liveComment[i]['Name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Common.displayWidth(context) * 0.04)),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.01),
                      Text(
                        liveComment[i]['Comment'],
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

  //TextBox
  _textBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.send),
          hintText: 'Send a message',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          focusedBorder: _outlineBorder,
          enabledBorder: _outlineBorder,
        ),
      ),
    );
  }

  var _outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.greyDark,
        width: 1.5,
      ));
}

List<dynamic> liveComment = [
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
    'Comment': 'Lorem ipsum is',
  },
  {
    'Name': 'Eva',
    'Comment': 'Lorem ipsum 💕',
  },
  {
    'Name': 'Mridula',
    'Comment': 'Lorem ipsum ',
  },
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
    'Comment': 'Lorem ipsum is',
  },
  {
    'Name': 'Eva',
    'Comment': 'Lorem ipsum 💕',
  },
  {
    'Name': 'Mridula',
    'Comment': 'Lorem ipsum ',
  },
];

List<dynamic> peopleInTheRoom = [
  {
    'Name': 'Surya',
    'image': Imag.artist_img2,
  },
  {
    'Name': 'Natasha',
    'image': Imag.image_dp_img,
  },
  {
    'Name': 'Gaytri',
    'image': Imag.artist_img3,
  },
  {
    'Name': 'Eva',
    'image': Imag.artist_img1,
  },
  {
    'Name': 'Mridula',
    'image': Imag.artist_img3,
  },
];
