import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';
import 'package:tetralive/widget/home_widgets/creator_live_time_item.dart';
import 'package:tetralive/widget/home_widgets/exclusive_live_item.dart';
import 'package:tetralive/widget/home_widgets/livestreams_item.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/widget/drawer.dart';
import 'package:tetralive/widget/home_widgets/you_may_like_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  var email;

  HomeScreen({
    this.email,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Home',
      isMenuButton: true,
      isBackButton: false,
      isCartButton: true,
      isNotificationButton: true,
      isHelp: false,
    );

    return Scaffold(
      drawer: MenuDrawer(),
      appBar: appbar,
      body: Container(
        height: Common.displayHeight(context) * 1,
        width: Common.displayWidth(context) * 1,
        child: ListView(
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.015),

            //************** SearchBox **************//
            _homeSearchBox(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.015),

            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),

            //************** ExclusiveLive **************//
            _exclusiveLive(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),

            //************** LiveStreams **************//
            _liveStreams(),

            //************** CreatorLiveTime **************//
            _creatorLiveTime(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),

            //************** YouMayLike **************//
            _youMayLike(),
          ],
        ),
      ),
    );
  }

  //************** SearchBox **************//
  _homeSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          onTap: () {
            Navigator.pushNamed(context, Routes.searchScreen);
          },
          readOnly: true,
          cursorColor: AppColors.greyDark,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,
                color: AppColors.greyDark,
                size: Common.displayHeight(context) * 0.035),
            hintText: Constant.searchBox,
            hintStyle: TextStyle(
                color: AppColors.greyDark,
                fontSize: Common.displayWidth(context) * 0.05),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  //************** ExclusiveLive **************//
  _exclusiveLive() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            Constant.exclusiveLive,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.deepBlack,
                fontSize: Common.displayWidth(context) * 0.04),
          ),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
        Container(
          height: Common.displayHeight(context) * 0.28,
          width: Common.displayWidth(context) * 1,
          child: PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: exclusivelive.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        height: Common.displayHeight(context) * 0.23,
                        width: Common.displayWidth(context) * 1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            exclusivelive[i]['image'],
                          ),
                          fit: BoxFit.cover,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    exclusivelive[i]['live_show'],
                                    style: TextStyle(
                                        backgroundColor: AppColors.deepRed,
                                        color: AppColors.deepWhite),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        exclusivelive[i]['view'],
                                        style: TextStyle(
                                            color: AppColors.deepWhite),
                                      ),
                                      Icon(
                                        Icons.visibility,
                                        color: AppColors.deepWhite,
                                        size: Common.displayHeight(context) *
                                            0.02,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              MaterialButton(
                                color: AppColors.primaryColor,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.buyTickets);
                                },
                                child: Text(exclusivelive[i]['ticket'],
                                    style:
                                        TextStyle(color: AppColors.deepWhite)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.01),
                      Row(
                        children: [
                          Text(exclusivelive[i]['title'],
                              style: TextStyle(
                                  color: AppColors.greyDark,
                                  fontSize:
                                      Common.displayWidth(context) * 0.04)),
                          Text(exclusivelive[i]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      Common.displayWidth(context) * 0.04)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  //************** LiveStreams **************//
  _liveStreams() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            Constant.liveStreams,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Common.displayWidth(context) * 0.04,
                color: AppColors.deepBlack),
          ),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
        Container(
          height: Common.displayHeight(context) * 0.28,
          width: Common.displayWidth(context) * 1,
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: livestream.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Common.displayHeight(context) * 0.23,
                        width: Common.displayWidth(context) * 0.8,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            livestream[i]['image'],
                          ),
                          fit: BoxFit.cover,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.redeem);
                                      },
                                      child: Text(
                                        livestream[i]['live_show'],
                                        style: TextStyle(
                                            backgroundColor: AppColors.deepRed,
                                            color: AppColors.deepWhite),
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        livestream[i]['view'],
                                        style: TextStyle(
                                            color: AppColors.deepWhite),
                                      ),
                                      Icon(
                                        Icons.visibility,
                                        color: AppColors.deepWhite,
                                        size: Common.displayHeight(context) *
                                            0.02,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.01),
                      Row(
                        children: [
                          Text(livestream[i]['title'],
                              style: TextStyle(
                                  color: AppColors.greyDark,
                                  fontSize:
                                      Common.displayWidth(context) * 0.04)),
                          Text(livestream[i]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      Common.displayWidth(context) * 0.04)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  //************** CreatorLiveTime **************//
  _creatorLiveTime() {
    return Container(
      height: Common.displayHeight(context) * 0.45,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: liveDate.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(liveDate[i].image!),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      liveDate[i].title!,
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.037,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      liveDate[i].subTitle!,
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.037,
                                          color: AppColors.deepGrey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      liveDate[i].dateTitle!,
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.037,
                                          color: AppColors.deepGrey),
                                    ),
                                    Text(
                                      liveDate[i].liveDate!,
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.037,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.86,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(liveDate[i].imagePoster!),
                                fit: BoxFit.cover)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(liveDate[i].comment!),
                              SizedBox(width: 10),
                              Icon(CupertinoIcons.chat_bubble),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.bell),
                              SizedBox(width: 10),
                              Icon(Icons.share_outlined),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  //************** YouMayLike **************//
  _youMayLike() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            Constant.youLike,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.deepBlack,
                fontSize: Common.displayWidth(context) * 0.04),
          ),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
        Container(
          height: Common.displayHeight(context) * 0.3,
          width: Common.displayWidth(context) * 1,
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: youmaylike.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Common.displayHeight(context) * 0.23,
                        width: Common.displayWidth(context) * 0.75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            youmaylike[i]['image'],
                          ),
                          fit: BoxFit.cover,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                youmaylike[i]['view'],
                                style: TextStyle(color: AppColors.deepWhite),
                              ),
                              Icon(
                                Icons.visibility,
                                color: AppColors.deepWhite,
                                size: Common.displayHeight(context) * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.01),
                      Row(
                        children: [
                          Text(youmaylike[i]['title'],
                              style: TextStyle(
                                  color: AppColors.deepGrey,
                                  fontSize:
                                      Common.displayWidth(context) * 0.04)),
                          Text(youmaylike[i]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      Common.displayWidth(context) * 0.04)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
