import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/constant_text.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/routes.dart';
import 'package:tetralive/utils/theme.dart';

class MyWalletScreen1 extends StatefulWidget {
  @override
  _MyWalletScreen1State createState() => _MyWalletScreen1State();
}

class _MyWalletScreen1State extends State<MyWalletScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.help);
              },
              icon: Text(
                'Help',
                style: TextStyle(color: AppColors.deepBlack),
              ),
            ),
          ),
        ],
        elevation: 5.0,
        leading: BackButton(
          color: AppColors.primaryColor,
        ),
        title: Text('My Wallet',
            style: TextStyle(
                color: AppColors.deepBlack,
                fontSize: Common.displayWidth(context) * 0.055)),
      ),
      body: Column(
        children: [
          _bankdetails(),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: TabBar(
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: Common.displayWidth(context) * 0.045),
                    labelColor: AppColors.primaryColor,
                    indicatorColor: AppColors.primaryColor,
                    indicatorWeight: 2,
                    unselectedLabelColor: AppColors.greyDark,
                    tabs: [
                      Tab(
                        text: 'RECEIVED',
                      ),
                      Tab(
                        text: 'PAID',
                      ),
                    ],
                  ),
                ),
                body: _received(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bankdetails() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 0.5,
          color: AppColors.greyDark,
        )),
      ),
      height: Common.displayHeight(context) * 0.170,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constant.bankDetails,
                  style: TextStyle(
                      fontSize: Common.displayWidth(context) * 0.05,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text(Constant.editBankDetails,
                        style: TextStyle(
                            fontSize: Common.displayWidth(context) * 0.05,
                            fontWeight: FontWeight.w700)),
                    InkWell(
                        onTap: () {},
                        child: Icon(Icons.edit, color: AppColors.primaryColor)),
                  ],
                )
              ],
            ),
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Text(Constant.bankUserNameTitle,
                    style: TextStyle(color: AppColors.greyDark)),
                Text(Constant.bankUserName,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              children: [
                Text(Constant.accountNumberTitle,
                    style: TextStyle(color: AppColors.greyDark)),
                Text(Constant.accountNumber,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              children: [
                Text(Constant.bankNameTitle,
                    style: TextStyle(color: AppColors.greyDark)),
                Text(Constant.bankName,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //receivedgiftanddonation
  _received() {
    return TabBarView(
      children: [
        ListView.separated(
            separatorBuilder: (context, i) => Divider(
                  color: AppColors.deepGrey,
                ),
            itemCount: received.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(received[i]['image']),
                                  radius: 35,
                                ),
                                Common.sizedBoxHeight(
                                    MediaQuery.of(context).size.height * 0.01),
                                Text(received[i]['name']),
                              ],
                            ),
                            Common.sizedBoxHeight(4),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    received[i]['received'],
                                    style: TextStyle(
                                        fontSize:
                                            Common.displayWidth(context) * 0.04,
                                        color: AppColors.deepGrey),
                                  ),
                                  Text('\₹ ${received[i]['price']}',
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.04,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800)),
                                  Text(received[i]['title'],
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.04,
                                          color: AppColors.deepGrey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(received[i]['date'],
                              style: TextStyle(
                                  fontSize: Common.displayWidth(context) * 0.04,
                                  color: AppColors.deepGrey)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
        ListView.separated(
            separatorBuilder: (context, i) => Divider(
                  color: AppColors.deepGrey,
                ),
            itemCount: received.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(received[i]['image']),
                                  radius: 35,
                                ),
                                Common.sizedBoxHeight(
                                    MediaQuery.of(context).size.height * 0.01),
                                Text(received[i]['name']),
                              ],
                            ),
                            Common.sizedBoxHeight(4),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    received[i]['received'],
                                    style: TextStyle(
                                        fontSize:
                                            Common.displayWidth(context) * 0.04,
                                        color: AppColors.deepGrey),
                                  ),
                                  Text('\₹ ${received[i]['price']}',
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.04,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800)),
                                  Text(received[i]['title'],
                                      style: TextStyle(
                                          fontSize:
                                              Common.displayWidth(context) *
                                                  0.04,
                                          color: AppColors.deepGrey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(received[i]['date'],
                              style: TextStyle(
                                  fontSize: Common.displayWidth(context) * 0.04,
                                  color: AppColors.deepGrey)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}

List<dynamic> received = [
  {
    'image': Imag.live_img6,
    'name': 'Shivani',
    'received': 'Received  ',
    'price': '140 ',
    'title': 'Gift',
    'date': '09/08/2020',
  },
  {
    'image': Imag.live_img4,
    'name': 'Akif',
    'received': 'Received  ',
    'price': '500 ',
    'title': 'donation',
    'date': '07/08/2020',
  },
  {
    'image': Imag.live_img3,
    'name': 'Sanal',
    'received': 'Received  ',
    'price': '100 ',
    'title': 'donation',
    'date': '27/07/2020',
  },
  {
    'image': Imag.live_img2,
    'name': 'Krishna',
    'received': 'Received  ',
    'price': '180 ',
    'title': 'Gift',
    'date': '12/07/2020',
  },
  {
    'image': Imag.live_img1,
    'name': 'Kalki',
    'received': 'Received  ',
    'price': '108 ',
    'title': 'donation',
    'date': '12/07/2020',
  },
  {
    'image': Imag.live_img6,
    'name': 'Shivani',
    'received': 'Received  ',
    'price': '140 ',
    'title': 'Gift',
    'date': '09/08/2020',
  },
  {
    'image': Imag.live_img4,
    'name': 'Shivani',
    'received': 'Received  ',
    'price': '140 ',
    'title': 'Gift',
    'date': '09/08/2020',
  },
  {
    'image': Imag.live_img3,
    'name': 'Shivani',
    'received': 'Received  ',
    'price': '140 ',
    'title': 'Gift',
    'date': '09/08/2020',
  },
  {
    'image': Imag.live_img2,
    'name': 'Shivani',
    'received': 'Received  ',
    'price': '140 ',
    'title': 'Gift',
    'date': '09/08/2020',
  },
  {
    'image': Imag.live_img1,
    'name': 'Shivani',
    'received': 'Received  ',
    'price': '140 ',
    'title': 'Gift',
    'date': '09/08/2020',
  },
];
