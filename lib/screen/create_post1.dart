import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class CreatePost1 extends StatefulWidget {
  @override
  _CreatePost1State createState() => _CreatePost1State();
}

class _CreatePost1State extends State<CreatePost1> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
        titleText: "Create Post",
        isMenuButton: false,
        isBackButton: true,
        isCartButton: false,
        isNotificationButton: false,
        isHelp: false);

    return Scaffold(
        appBar: appbar,
        body: Column(
          children: [
            _textBox(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  //TextBox
                  _galleryPhotoVideoPost(),
                ],
              ),
            ),
          ],
        )
        //TextBox
        );
  }

  //TextBox
  _textBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: TextField(
        maxLines: 6,
        maxLength: 250,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          counterText: "",
          hintText: Constant.createYourPost,
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

  //GalleryPhotoVideoPost
  _galleryPhotoVideoPost() {
    return Container(
        height: Common.displayHeight(context) * 0.63,
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: TabBar(
                  indicatorWeight: 2.5,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: AppColors.greyDark,
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.primaryColor,
                  tabs: [
                    Tab(text: "GALLERY"),
                    Tab(text: "PHOTO"),
                    Tab(text: "VIDEO"),
                  ]),
            ),
            body: _postUpload(),
          ),
        ));
  }

  //PostUpLoad
  _postUpload() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: MaterialButton(
        onPressed: () {},
        height: Common.displayHeight(context) * 0.06,
        minWidth: Common.displayWidth(context) * 1,
        color: AppColors.primaryColor,
        child: Text(
          'POST',
          style: TextStyle(
              color: AppColors.deepWhite,
              fontSize: Common.displayWidth(context) * 0.05),
        ),
      ),
    );
  }
}
