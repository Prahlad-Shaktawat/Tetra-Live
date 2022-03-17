import 'package:flutter/material.dart';
import 'package:tetralive/utils/common.dart';
import 'package:tetralive/utils/theme.dart';
import 'package:tetralive/widget/customappbar.dart';

class Terms_Conditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appbar = CustomAppBar(
      titleText: 'Terms & Conditions',
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
        width: MediaQuery.of(context).size.width * 1,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            //termsandconditions
            _termsconditions(context),
          ],
        ),
      ),
    );
  }

  //termsandconditions
  _termsconditions(BuildContext context) {
    return Container(
      height: Common.displayHeight(context) * 0.9,
      child: ListView.builder(
          itemCount: tersmcondition.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Common.sizedBoxHeight(
                      MediaQuery.of(context).size.height * 0.03),
                  Text(tersmcondition[i]['title'],
                      style: TextStyle(
                          fontSize: Common.displayWidth(context) * 0.06,
                          fontWeight: FontWeight.w600)),
                  Common.sizedBoxHeight(
                      MediaQuery.of(context).size.height * 0.02),
                  Text(
                    tersmcondition[i]['details'],
                    style: TextStyle(
                      color: AppColors.greyDark,
                      fontSize: Common.displayWidth(context) * 0.04,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

List<dynamic> tersmcondition = [
  {
    'title': 'Overview',
    'details': "lorem ipsum is simply dummy text of the "
        "printing and typesetting industry. "
        "Lorem ipsum has been the industry's standard dummy"
        " text ever since the 1500s, when an unknown printer took a galley of"
  },
  {
    'title': 'Section 1',
    'details': "Contrary to popular belief , Lorem Ipsum is not simply random text . "
        "It has roots in a piece of classical Latin literature from 45 BC , making it over 2000 years old . "
        "Richard McClintock , a Latin professor at Hampden - Sydney College in Virginia , looked up one of the more"
        " obscure Latin words , consectetur , from a Lorem Ipsum passage , and going through the cites of"
        " the word in classical literature , discovered the undoubtable source ."
  },
  {
    'title': 'Section 2',
    'details': "Contrary to popular belief, Lorem Ipsum is not simply random text. "
        "It has roots in a piece of classical Latin literature from 45 BC, making it"
        " over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydrney College in Virginia"
  },
];
