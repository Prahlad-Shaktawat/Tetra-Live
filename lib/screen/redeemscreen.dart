import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class RedeemScreen extends StatefulWidget {
  @override
  _RedeemScreenState createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Redeem',
      isMenuButton: false,
      isBackButton: true,
      isCartButton: false,
      isNotificationButton: false,
      isHelp: true,
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
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),

            //buyticketsandredeem
            _buytickets(),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),

            //shopandredeem
            _shopandredeem(),

            //giftyourrewardstitle
            _giftyourrewardstitle(),

            //artist
            _artist(),
          ],
        ),
      ),
    );
  }

  //buyticketsandredeem
  _buytickets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(Constant.buyTicketsAndRedeem,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Common.displayWidth(context) * 0.04)),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.015),
        Container(
          height: Common.displayHeight(context) * 0.25,
          width: Common.displayWidth(context) * 1,
          child: ListView.builder(
              itemCount: buyTickets.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        height: Common.displayHeight(context) * 0.23,
                        width: Common.displayWidth(context) * 0.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(buyTickets[i]['liveImage']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    buyTickets[i]['liveShow'],
                                    style: TextStyle(
                                        backgroundColor: AppColors.deepRed,
                                        color: AppColors.deepWhite),
                                  ),
                                  Row(
                                    children: [
                                      Text(buyTickets[i]['view'],
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Icon(
                                        Icons.visibility,
                                        color: AppColors.deepWhite,
                                        size:
                                            Common.displayWidth(context) * 0.04,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              MaterialButton(
                                  color: AppColors.primaryColor,
                                  onPressed: () {},
                                  child: Text(
                                    buyTickets[i]['tickets'],
                                    style:
                                        TextStyle(color: AppColors.deepWhite),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  //shopandredeem
  _shopandredeem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(Constant.shopAndRedeem,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Common.displayWidth(context) * 0.04)),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
        Container(
          height: Common.displayHeight(context) * 0.2,
          width: Common.displayWidth(context) * 1,
          child: ListView.builder(
              itemCount: shopRedeem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        shopRedeem[i]['image'],
                        height: Common.displayHeight(context) * 0.1,
                        width: Common.displayWidth(context) * 0.2,
                      ),
                      Common.sizedBoxHeight(
                          MediaQuery.of(context).size.height * 0.02),
                      Text(shopRedeem[i]['name']),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  //giftyourrewardstitle
  _giftyourrewardstitle() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(Constant.favoriteArtist,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Common.displayWidth(context) * 0.04)),
          ),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.03),
        Container(
          height: Common.displayHeight(context) * 0.05,
          width: Common.displayWidth(context) * 0.96,
          decoration: BoxDecoration(
            border: Border.all(
                width: Common.displayWidth(context) * 0.003,
                color: AppColors.deepBlack),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: AppColors.greyDark,
                  fontSize: Common.displayWidth(context) * 0.04),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.greyDark,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }

  //artist
  _artist() {
    return Container(
      alignment: Alignment.center,
      height: Common.displayHeight(context) * 0.25,
      width: Common.displayWidth(context) * 1,
      child: ListView.builder(
          itemCount: favoriteArtist.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(favoriteArtist[i]['image']),
                    radius: 60,
                  ),
                  Common.sizedBoxHeight(
                      MediaQuery.of(context).size.height * 0.02),
                  Text(favoriteArtist[i]['name']),
                ],
              ),
            );
          }),
    );
  }

  List<dynamic> buyTickets = [
    {
      'liveImage': Imag.live_img5,
      'liveShow': ' Live ',
      'view': '5k',
      'tickets': 'BUY TICKETS',
    },
    {
      'liveImage': Imag.live_img7,
      'liveShow': ' Live ',
      'view': '2k',
      'tickets': 'BUY TICKETS',
    },
  ];

  List<dynamic> shopRedeem = [
    {
      'image': Imag.redeem_img1,
      'name': 'StyleKnots',
    },
    {
      'image': Imag.redeem_img2,
      'name': 'T shirt',
    },
    {
      'image': Imag.redeem_img3,
      'name': 'Baggi',
    },
    {
      'image': Imag.redeem_img4,
      'name': 'Gap',
    },
    {
      'image': Imag.redeem_img1,
      'name': 'StyleKnots',
    },
    {
      'image': Imag.redeem_img2,
      'name': 'T shirt',
    },
    {
      'image': Imag.redeem_img3,
      'name': 'Baggi',
    },
    {
      'image': Imag.redeem_img4,
      'name': 'Gap',
    },
  ];

  List<dynamic> favoriteArtist = [
    {
      'image': Imag.artist_img1,
      'name': 'natasha',
    },
    {
      'image': Imag.artist_img2,
      'name': 'singer',
    },
    {
      'image': Imag.artist_img3,
      'name': 'singer2',
    },
  ];
}
