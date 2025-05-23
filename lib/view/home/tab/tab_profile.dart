import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../../bloc/profile/profile_bloc.dart';
import '../../../data/prefs.dart';
import '../../../repository/profile_repository.dart';
import '../../../routes/app_routes.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return BlocProvider<ProfileBloc>(
      create: (context) {
        final bloc = ProfileBloc(repository: ProfileRepository(context));
        Prefs.getToken().then((storedToken) {
          if (storedToken != null) {
            bloc.add(LoadProfile(storedToken));
          }
        });
        return bloc;
      },
      child: SafeArea(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
          child: Column(
            children: [
              getVerSpace(FetchPixels.getPixelHeight(20)),
              Align(
                alignment: Alignment.topCenter,
                child: getCustomFont("Profile", 24, Colors.black, 1,
                    fontWeight: FontWeight.w800),
              ),
              getVerSpace(FetchPixels.getPixelHeight(40)),

              /// Profile Image from API using BlocBuilder
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return Container(
                      height: FetchPixels.getPixelHeight(100),
                      width: FetchPixels.getPixelHeight(100),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(state.employee.image),
                        ),
                      ),
                    );
                  } else if (state is ProfileLoading) {
                    return SizedBox(
                      height: FetchPixels.getPixelHeight(100),
                      width: FetchPixels.getPixelHeight(100),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return Container(
                      height: FetchPixels.getPixelHeight(100),
                      width: FetchPixels.getPixelHeight(100),
                      decoration: BoxDecoration(
                        image: getDecorationAssetImage(context, "profile.png"),
                      ),
                    );
                  }
                },
              ),

              getVerSpace(FetchPixels.getPixelHeight(44)),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    getButtonWithIcon(
                        context, Colors.white, "My Profile", Colors.black, () {
                      Constant.sendToNext(context, Routes.myProfileScreenRoute);
                    }, 16,
                        weight: FontWeight.w400,
                        buttonHeight: FetchPixels.getPixelHeight(60),
                        borderRadius: BorderRadius.circular(
                            FetchPixels.getPixelHeight(12)),
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0.0, 4.0)),
                        ],
                        prefixIcon: true,
                        prefixImage: "user.svg",
                        sufixIcon: true,
                        suffixImage: "arrow_right.svg"),
                    getVerSpace(FetchPixels.getPixelHeight(20)),
                    // getButtonWithIcon(
                    //     context, Colors.white, "Privacy Policy", Colors.black,
                    //     () {
                    //   Constant.sendToNext(context, Routes.privacyRoute);
                    // }, 16,
                    //     weight: FontWeight.w400,
                    //     buttonHeight: FetchPixels.getPixelHeight(60),
                    //     borderRadius: BorderRadius.circular(
                    //         FetchPixels.getPixelHeight(12)),
                    //     boxShadow: [
                    //       const BoxShadow(
                    //           color: Colors.black12,
                    //           blurRadius: 10,
                    //           offset: Offset(0.0, 4.0)),
                    //     ],
                    //     prefixIcon: true,
                    //     prefixImage: "privacy.svg",
                    //     sufixIcon: true,
                    //     suffixImage: "arrow_right.svg"),
                    // getVerSpace(FetchPixels.getPixelHeight(20)),
                    // getButtonWithIcon(
                    //     context, Colors.white, "Terms of Use", Colors.black,
                    //     () {
                    //   Constant.sendToNext(context, Routes.termOfUseRoute);
                    // }, 16,
                    //     weight: FontWeight.w400,
                    //     buttonHeight: FetchPixels.getPixelHeight(60),
                    //     borderRadius: BorderRadius.circular(
                    //         FetchPixels.getPixelHeight(12)),
                    //     boxShadow: [
                    //       const BoxShadow(
                    //           color: Colors.black12,
                    //           blurRadius: 10,
                    //           offset: Offset(0.0, 4.0)),
                    //     ],
                    //     prefixIcon: true,
                    //     prefixImage: "termuse.svg",
                    //     sufixIcon: true,
                    //     suffixImage: "arrow_right.svg"),
                    // getVerSpace(FetchPixels.getPixelHeight(20)),
                    getButtonWithIcon(
                        context, Colors.white, "Support", Colors.black, () {
                      Constant.sendToNext(context, Routes.supportRoute);
                    }, 16,
                        weight: FontWeight.w400,
                        buttonHeight: FetchPixels.getPixelHeight(60),
                        borderRadius: BorderRadius.circular(
                            FetchPixels.getPixelHeight(12)),
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0.0, 4.0)),
                        ],
                        prefixIcon: true,
                        prefixImage: "headphone.svg",
                        sufixIcon: true,
                        suffixImage: "arrow_right.svg"),
                    getVerSpace(FetchPixels.getPixelHeight(20)),
                    // getButtonWithIcon(
                    //     context, Colors.white, "Report", Colors.black, () {
                    //   Constant.sendToNext(context, Routes.reportRoute);
                    // }, 16,
                    //     weight: FontWeight.w400,
                    //     buttonHeight: FetchPixels.getPixelHeight(60),
                    //     borderRadius: BorderRadius.circular(
                    //         FetchPixels.getPixelHeight(12)),
                    //     boxShadow: [
                    //       const BoxShadow(
                    //           color: Colors.black12,
                    //           blurRadius: 10,
                    //           offset: Offset(0.0, 4.0)),
                    //     ],
                    //     prefixIcon: true,
                    //     prefixImage: "documnet.svg",
                    //     sufixIcon: true,
                    //     suffixImage: "arrow_right.svg"),
                    getVerSpace(FetchPixels.getPixelHeight(40)),
                    getButton(context, greenColor, "Logout", Colors.white, () {
                      Constant.closeApp();
                    }, 18,
                        weight: FontWeight.w600,
                        buttonHeight: FetchPixels.getPixelHeight(60),
                        borderRadius: BorderRadius.circular(
                            FetchPixels.getPixelHeight(14))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
