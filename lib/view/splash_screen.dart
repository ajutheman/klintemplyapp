import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:provider_man_app/base/resizer/fetch_pixels.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/pref_data.dart';
import '../../base/widget_utils.dart';
import '../base/resizer/fetch_pixels.dart';
import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    PrefData.isLogIn().then((value) {
      Timer(
        const Duration(seconds: 3),
        () {
          (value)
              ? Constant.sendToNext(context, Routes.homeScreenRoute)
              : Constant.sendToNext(context, Routes.loginRoute);
        },
      );
    });
  }

  void backClick() {
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            color: backGroundColor,
            child: Center(
                child: getAssetImage(
                    "splash_logo.png",
                    FetchPixels.getPixelHeight(180),
                    FetchPixels.getPixelHeight(180))),
          ),
        ),
        onWillPop: () async {
          backClick();
          return false;
        });
  }
}
