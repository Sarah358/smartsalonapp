import 'package:fluttersalonapp/utils/BMColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseMoreScreen extends StatelessWidget {
  final bool? enableAppbar;

  PurchaseMoreScreen({this.enableAppbar = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bmLightScaffoldBackgroundColor,
        body: Stack(
          children: [
            Icon(Icons.arrow_back, size: 24).paddingAll(16).onTap(() {
              finish(context);
            }).visible(enableAppbar!),
            SizedBox(
              width: context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: boxDecorationDefault(),
                    padding: EdgeInsets.all(16),
                    child: Image.asset("images/salon_three.jpg", height: 100),
                  ),
                  22.height,
                  Text(
                    '',
                    style: boldTextStyle(size: 22),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  // AppButton(
                  //   text: 'EXPLORE MO',
                  //   color: context.primaryColor,
                  //   textStyle: boldTextStyle(color: Colors.white),
                  //   shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
                  //   onTap: () {
                  //     //launch("https://codecanyon.net/item/prokit-flutter-app-ui-design-templete-kit/25787190?s_rank=19");
                  //   },
                  // )
                ],
              ),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
