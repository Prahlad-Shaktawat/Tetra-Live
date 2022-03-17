import 'package:flutter/material.dart';

import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/providerclass.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';
import 'package:provider/provider.dart';

class BuyTickets extends StatefulWidget {
  @override
  _BuyTicketsState createState() => _BuyTicketsState();
}

class _BuyTicketsState extends State<BuyTickets> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Buy tickets',
      isMenuButton: false,
      isBackButton: true,
      isCartButton: true,
      isNotificationButton: true,
      isHelp: false,
    );

    Provider.of<Counter>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: Container(
        height: Common.displayHeight(context) * 1,
        width: Common.displayWidth(context) * 1,
        child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),

              //livestreams
              _livestreams(),

              //buyyourartistmerchandise
              _buyyourartistmerchandise(),

              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),

              //superfanculbandtipandtreat
              _button(),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
              Divider(
                color: Colors.grey,
              ),

              //makeawish
              _makeawish(context),
              Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.03),

              //sendmessagebox
            ]),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: _sendmessagebox(),
      ),
    );
  }

  //livestreams
  _livestreams() {
    return Container(
      alignment: Alignment.center,
      height: Common.displayHeight(context) * 0.32,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: livestream.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: Common.displayWidth(context) * 1,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(livestream[i]["liveImage"]),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            livestream[i]["title"],
                            style: TextStyle(
                                fontSize: Common.displayWidth(context) * 0.04,
                                color: AppColors.deepGrey),
                          ),
                          Text(
                            livestream[i]["name"],
                            style: TextStyle(
                                fontSize: Common.displayWidth(context) * 0.04,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      MaterialButton(
                        color: AppColors.primaryColor,
                        onPressed: () {},
                        child: Text(
                          "FOLLOW",
                          style: TextStyle(color: AppColors.deepWhite),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  //buyyourartistmerchandise
  _buyyourartistmerchandise() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
        Container(
          height: Common.displayHeight(context) * 0.18,
          width: Common.displayWidth(context) * 1,
          child: ListView.builder(
              itemCount: shopRedeem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    shopRedeem[i]['image'],
                    height: Common.displayHeight(context) * 0.1,
                    width: Common.displayWidth(context) * 0.25,
                  ),
                );
              }),
        ),
      ],
    );
  }

  //superfanclubandtipandtreat
  _button() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Text(Constant.artistMerchandise,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Common.displayWidth(context) * 0.04)),
        ),
        Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.02),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          MaterialButton(
            height: Common.displayHeight(context) * 0.06,
            minWidth: Common.displayWidth(context) * 0.45,
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                width: Common.displayWidth(context) * 0.005,
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            onPressed: () {},
            child: Text(Constant.superFanClub,
                style:
                    TextStyle(fontSize: Common.displayWidth(context) * 0.04)),
          ),
          MaterialButton(
            height: Common.displayHeight(context) * 0.06,
            minWidth: Common.displayWidth(context) * 0.45,
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                width: Common.displayWidth(context) * 0.005,
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            onPressed: () {},
            child: Text(Constant.tipTreat,
                style:
                    TextStyle(fontSize: Common.displayWidth(context) * 0.04)),
          ),
        ]),
      ],
    );
  }

  //makeawish
  _makeawish(model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: Common.displayHeight(context) * 0.055,
          width: Common.displayWidth(context) * 0.45,
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: AppColors.greyDark),
          ),
          child: Consumer<Counter>(builder: (context, model, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => model.wishTicketDecrement(),
                      child: Icon(Icons.remove,
                          size: Common.displayHeight(context) * 0.05,
                          color: AppColors.deepBlack),
                    ),
                    Common.sizedBoxWidth(
                        MediaQuery.of(context).size.width * 0.03),
                    Text(
                      '\₹${model.wishTicketCounter.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Common.displayWidth(context) * 0.05,
                          color: AppColors.deepBlack),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => model.wishTicketIncrement(),
                  child: Icon(Icons.add,
                      size: Common.displayHeight(context) * 0.05,
                      color: AppColors.deepBlack),
                ),
              ],
            );
          }),
        ),
        Common.sizedBoxWidth(MediaQuery.of(context).size.width * 0.05),
        MaterialButton(
          height: Common.displayHeight(context) * 0.055,
          minWidth: Common.displayWidth(context) * 0.35,
          color: AppColors.primaryColor,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {},
          child: Text(
            Constant.makeAWish,
            style: TextStyle(color: AppColors.deepWhite),
          ),
        ),
      ],
    );
  }

  //sendmessagebox
  _sendmessagebox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Common.displayHeight(context) * 0.06,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: AppColors.deepGrey),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: Constant.sendAMessageBuy,
              hintStyle: TextStyle(
                  color: AppColors.greyDark,
                  fontSize: Common.displayWidth(context) * 0.04),
              suffixIcon: Icon(
                Icons.send,
                color: AppColors.greyDark,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  List<dynamic> livestream = [
    {
      'liveImage': Imag.live_img3,
      'liveShow': ' Live ',
      'view': '5k',
      'title': 'Streaming now ',
      'name': 'NICOTINE',
    },
  ];

  List<dynamic> shopRedeem = [
    {
      'image': Imag.reward_img,
    },
    {
      'image': Imag.reward_img1,
    },
    {
      'image': Imag.reward_img2,
    },
    {
      'image': Imag.reward_img3,
    },
  ];
}
