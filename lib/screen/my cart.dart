import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class My_Cart_Screen extends StatefulWidget {
  @override
  _My_Cart_ScreenState createState() => _My_Cart_ScreenState();
}

class _My_Cart_ScreenState extends State<My_Cart_Screen> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'My cart',
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
        child: Column(
          children: [
            _calender(),

            //addbtnbuybtn
            _addbtnbuybtn(),
          ],
        ),
      ),
    );
  }

  //calenderpic
  _calender() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 1,
      alignment: Alignment.center,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.04),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 1,
            child: PageView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: calenderdetails.length,
                itemBuilder: (context, i) {
                  return Image.asset(
                    calenderdetails[i]['Calenderimg'],
                    fit: BoxFit.contain,
                  );
                }),
          ),
          Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constant.calenderYear,
                    style: TextStyle(
                        fontSize: Common.displayWidth(context) * 0.05,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Constant.calenderPrice,
                    style: TextStyle(
                        fontSize: Common.displayWidth(context) * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                  Common.sizedBoxHeight(
                      MediaQuery.of(context).size.height * 0.03),
                  Text(Constant.calenderDescription,
                      style: TextStyle(
                          fontSize: Common.displayWidth(context) * 0.04,
                          fontWeight: FontWeight.w600)),
                  Text(
                    Constant.calenderDetails,
                    style: TextStyle(
                        fontSize: Common.displayWidth(context) * 0.04,
                        color: AppColors.deepGrey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //addbtnbuybtn
  _addbtnbuybtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            height: Common.displayHeight(context) * 0.06,
            minWidth: Common.displayWidth(context) * 0.4,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: Common.displayWidth(context) * 0.005,
                color: AppColors.primaryColor,
              ),
            ),
            onPressed: () {},
            child: Text(
              Constant.addCartBtn,
              style: TextStyle(
                  fontSize: Common.displayWidth(context) * 0.05,
                  color: AppColors.primaryColor),
            ),
          ),
          MaterialButton(
            height: Common.displayHeight(context) * 0.06,
            minWidth: Common.displayWidth(context) * 0.43,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: AppColors.primaryColor,
            onPressed: () {},
            child: Text(
              Constant.buyBtn,
              style: TextStyle(
                  fontSize: Common.displayWidth(context) * 0.05,
                  color: AppColors.deepWhite),
            ),
          ),
        ],
      ),
    );
  }
}

//calenderimg
List<dynamic> calenderdetails = [
  {
    'Calenderimg': Imag.calender_img,
  },
  {
    'Calenderimg': Imag.calender_img,
  },
];
