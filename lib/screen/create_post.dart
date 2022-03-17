import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';
import 'package:tetralive/utils/img.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
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
            //TextBox
            _textBox(),

            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                //GalleryPhotoVideoPost

                _galleryPhotoVideoPost(),

                //PostUpLoad
                _postUpload(),
              ],
            )),
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
        height: Common.displayHeight(context) * 0.61,
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
            body: _postCreate(),
          ),
        ));
  }

  //PostCreate
  _postCreate() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: TabBarView(physics: BouncingScrollPhysics(), children: [
        GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: galleryItem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  galleryItem[i]['image'],
                  fit: BoxFit.cover,
                  height: Common.displayHeight(context) * 0.05,
                ),
              );
            }),
        GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: galleryItem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  galleryItem[i]['image'],
                  fit: BoxFit.cover,
                  height: Common.displayHeight(context) * 0.05,
                ),
              );
            }),
        GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: galleryItem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  galleryItem[i]['image'],
                  fit: BoxFit.cover,
                  height: Common.displayHeight(context) * 0.05,
                ),
              );
            }),
      ]),
    );
  }

  //PostUpLoad
  _postUpload() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

List<dynamic> galleryItem = [
  {
    'image': Imag.live_img1,
  },
  {
    'image': Imag.live_img2,
  },
  {
    'image': Imag.live_img3,
  },
  {
    'image': Imag.live_img4,
  },
  {
    'image': Imag.live_img1,
  },
  {
    'image': Imag.live_img2,
  },
  {
    'image': Imag.live_img3,
  },
  {
    'image': Imag.live_img4,
  },
];
