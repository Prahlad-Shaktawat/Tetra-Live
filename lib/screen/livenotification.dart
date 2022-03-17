import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class Live_notification extends StatefulWidget {
  @override
  _Live_notificationState createState() => _Live_notificationState();
}

class _Live_notificationState extends State<Live_notification> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Notification',
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
          physics: NeverScrollableScrollPhysics(),
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
            //liveStreamNotification
            _liveStreamNotification(),
            Divider(),

            //wishNotification
            _wishNotification(),
          ],
        ),
      ),
    );
  }

  //liveStreamNotification
  _liveStreamNotification() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constant.liveNotification,
                style: TextStyle(
                    color: AppColors.deepBlack,
                    fontSize: Common.displayWidth(context) * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {},
                child: Text(Constant.liveAllNotification,
                    style: TextStyle(
                      fontSize: Common.displayWidth(context) * 0.035,
                      color: AppColors.primaryColor,
                    )),
              ),
            ],
          ),
          Container(
            height: Common.displayHeight(context) * 0.3985,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: livestream.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(livestream[i]['image']),
                        radius: 30,
                      ),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.1),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                            livestream[i]['name'] != null
                                ? livestream[i]['name']
                                : 'Name Error',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    Common.displayWidth(context) * 0.045)),
                      ),
                      Text(
                          livestream[i]['live'] != null
                              ? livestream[i]['live']
                              : 'live Error',
                          style: TextStyle(
                              color: AppColors.deepGrey,
                              fontSize: Common.displayWidth(context) * 0.045)),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  //wishNotification
  _wishNotification() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constant.wishNotification,
                style: TextStyle(
                    color: AppColors.deepBlack,
                    fontSize: Common.displayWidth(context) * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {},
                child: Text(Constant.wishAllNotification,
                    style: TextStyle(
                      fontSize: Common.displayWidth(context) * 0.034,
                      color: AppColors.primaryColor,
                    )),
              )
            ],
          ),
          Container(
            height: Common.displayHeight(context) * 0.3985,
            child: ListView.builder(
                itemCount: wishnotification.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(wishnotification[i]['image']),
                        radius: 30,
                      ),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.1),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(wishnotification[i]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                                fontSize:
                                    Common.displayWidth(context) * 0.045)),
                      ),
                      Text(wishnotification[i]['wish'],
                          style: TextStyle(
                              color: AppColors.deepGrey,
                              fontSize: Common.displayWidth(context) * 0.045)),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

List<dynamic> livestream = [
  {
    'image': 'asset/image1.jpg',
    'name': 'Manasa ',
    'live': 'is live streaming now',
  },
  {
    'image': 'asset/image2.jpg',
    'name': 'Mike ',
    'live': 'is live streaming now',
  },
  {
    'image': 'asset/image3.jpg',
    'name': 'Setlla ',
    'live': 'is live streaming now',
  },
  {
    'image': 'asset/image1.jpg',
    'name': 'Manasa ',
    'live': 'is live streaming now',
  },
  {
    'image': 'asset/image2.jpg',
    'name': 'Mike ',
    'live': 'is live streaming now',
  },
  {
    'image': 'asset/image3.jpg',
    'name': 'Setlla ',
    'live': 'is live streaming now',
  },
];

List<dynamic> wishnotification = [
  {
    'image': 'asset/image4.jpg',
    'name': 'Nick ',
    'wish': 'made a wish',
  },
  {
    'image': 'asset/image5.jpg',
    'name': 'Manoj ',
    'wish': 'made a wish',
  },
  {
    'image': 'asset/image6.jpg',
    'name': 'Shiva ',
    'wish': 'made a wish',
  },
  {
    'image': 'asset/image4.jpg',
    'name': 'Nick ',
    'wish': 'made a wish',
  },
  {
    'image': 'asset/image5.jpg',
    'name': 'Manoj ',
    'wish': 'made a wish',
  },
  {
    'image': 'asset/image6.jpg',
    'name': 'Shiva ',
    'wish': 'made a wish',
  },
];
