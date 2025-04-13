import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../base/resizer/fetch_pixels.dart';
import '../../bloc/profile/profile_bloc.dart';
import '../../data/model/employee_model.dart';
import '../../data/prefs.dart';
import '../../repository/profile_repository.dart';
import '../../routes/app_routes.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
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
      child: WillPopScope(
        onWillPop: () async {
          Constant.backToPrev(context);
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          bottomNavigationBar: editProfileButton(context),
          body: SafeArea(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileLoaded) {
                  final emp = state.employee;
                  return profileView(emp, context);
                } else if (state is ProfileError) {
                  return Center(child: Text(state.error));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget profileView(EmployeeModel emp, BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getVerSpace(FetchPixels.getPixelHeight(20)),
          gettoolbarMenu(context, "back.svg", () {
            Constant.backToPrev(context);
          },
              istext: true,
              title: "My Profile",
              weight: FontWeight.w800,
              fontsize: 24,
              textColor: Colors.black),
          getVerSpace(FetchPixels.getPixelHeight(40)),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: FetchPixels.getPixelHeight(50),
              backgroundImage: NetworkImage(emp.image),
            ),
          ),
          getVerSpace(FetchPixels.getPixelHeight(40)),
          getCustomFont("Customer Name", 16, textColor, 1,
              fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(6)),
          getCustomFont(emp.name, 16, Colors.black, 1,
              fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          getDivider(dividerColor, 0, 1),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          getCustomFont("Email", 16, textColor, 1, fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(6)),
          getCustomFont(emp.email, 16, Colors.black, 1,
              fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          getDivider(dividerColor, 0, 1),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          getCustomFont("Phone No", 16, textColor, 1,
              fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(6)),
          getCustomFont(emp.phone1, 16, Colors.black, 1,
              fontWeight: FontWeight.w400),
        ],
      ),
    );
  }

  Widget editProfileButton(BuildContext context) {
    return Container(
      color: backGroundColor,
      padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
      child: getButton(context, greenColor, "Edit Profile", Colors.white, () {
        Constant.sendToNext(context, Routes.editProfileScreenRoute);
      }, 18,
          weight: FontWeight.w600,
          buttonHeight: FetchPixels.getPixelHeight(60),
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(14))),
    );
  }
}
