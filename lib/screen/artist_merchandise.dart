import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/img.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class ArtistMerchandise extends StatefulWidget {
  @override
  _ArtistMerchandiseState createState() => _ArtistMerchandiseState();
}

class _ArtistMerchandiseState extends State<ArtistMerchandise> {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
        titleText: "Artist Merchandise",
        isMenuButton: false,
        isBackButton: true,
        isCartButton: false,
        isNotificationButton: false,
        isHelp: false);

    return Scaffold(
      appBar: appbar,
      body: Container(
        height: Common.displayHeight(context) * 1,
        width: Common.displayWidth(context) * 1,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Common.sizedBoxHeight(MediaQuery.of(context).size.height * 0.01),
            _artistMerchandise(),
          ],
        ),
      ),
    );
  }

  _artistMerchandise() {
    return Container(
      height: Common.displayHeight(context) * 0.9,
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: artistMerchandiseItem.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                elevation: 3.0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      artistMerchandiseItem[i]['image'],
                      height: Common.displayHeight(context) * 0.15,
                    )),
                    Common.sizedBoxHeight(
                        MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            artistMerchandiseItem[i]['name'],
                            style: TextStyle(
                              color: AppColors.greyDark,
                            ),
                          ),
                          Text("\$${artistMerchandiseItem[i]['price']}"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

List<dynamic> artistMerchandiseItem = [
  {
    'image': Imag.reward_img3,
    'name': "Bag",
    'price': "400",
  },
  {
    'image': Imag.reward_img1,
    'name': "Coffee Mug",
    'price': "400",
  },
  {
    'image': Imag.reward_img,
    'name': "Key Bunch",
    'price': "400",
  },
  {
    'image': Imag.reward_img3,
    'name': "Bag",
    'price': "400",
  },
  {
    'image': Imag.reward_img1,
    'name': "Coffee Mug",
    'price': "400",
  },
  {
    'image': Imag.reward_img,
    'name': "Key Bunch",
    'price': "400",
  },
  {
    'image': Imag.reward_img3,
    'name': "Bag",
    'price': "400",
  },
  {
    'image': Imag.reward_img1,
    'name': "Coffee Mug",
    'price': "400",
  },
  {
    'image': Imag.reward_img,
    'name': "Key Bunch",
    'price': "400",
  },
  {
    'image': Imag.reward_img3,
    'name': "Bag",
    'price': "400",
  },
  {
    'image': Imag.reward_img1,
    'name': "Coffee Mug",
    'price': "400",
  },
  {
    'image': Imag.reward_img,
    'name': "Key Bunch",
    'price': "400",
  },
  {
    'image': Imag.reward_img3,
    'name': "Bag",
    'price': "400",
  },
  {
    'image': Imag.reward_img1,
    'name': "Coffee Mug",
    'price': "400",
  },
  {
    'image': Imag.reward_img,
    'name': "Key Bunch",
    'price': "400",
  },
  {
    'image': Imag.reward_img3,
    'name': "Bag",
    'price': "400",
  },
  {
    'image': Imag.reward_img1,
    'name': "Coffee Mug",
    'price': "400",
  },
  {
    'image': Imag.reward_img,
    'name': "Key Bunch",
    'price': "400",
  },
];
