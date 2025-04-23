import 'package:flutter/material.dart';
import 'package:kleanitemployeeapp/view/home/tab/history_bloc_provider.dart';
import 'package:kleanitemployeeapp/view/home/tab/schedule_bloc_provider.dart';
import 'package:kleanitemployeeapp/view/home/tab/tab_booking.dart';
import 'package:kleanitemployeeapp/view/home/tab/tab_history.dart';
import 'package:kleanitemployeeapp/view/home/tab/tab_profile.dart';
import 'package:kleanitemployeeapp/view/home/tab/tab_schedule.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../base/resizer/fetch_pixels.dart';
import 'booking/booking_bloc_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int position = 0;
  List<Widget> tabList = [
    // const TabBooking(),

    const BookingBlocProvider(child: TabBooking()),
    const ScheduleBlocProvider(child: TabSchedule()), // ✅ Wrapped properly
    // const TabSchedule(), // Add this to your `tabList`
    // const TabHistory(),
    const HistoryBlocProvider(child: TabHistory()),
    // const TabChat(),
    // const TabReview(),
    const TabProfile()
  ];

  List<String> itemList = [
    "documnet.svg",
    "documnet.svg",
    "review.svg",
    // "notification_unselected.svg",
    // "review.svg",
    "user.svg"
  ];

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          body: tabList[position],
          bottomNavigationBar: bottomNavigationBar(),
        ),
        onWillPop: () async {
          Constant.closeApp();
          return false;
        });
  }

  Container bottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
      height: FetchPixels.getPixelHeight(100),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 10, offset: Offset(0.0, 4.0)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(itemList.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                position = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: position == index ? greenColor : Colors.transparent,
                  shape: BoxShape.circle),
              child: Padding(
                padding: EdgeInsets.all(FetchPixels.getPixelHeight(13)),
                child: getSvgImage(itemList[index],
                    width: FetchPixels.getPixelHeight(24),
                    height: FetchPixels.getPixelHeight(24),
                    color: position == index ? Colors.white : null),
              ),
            ),
          );
        }),
      ), // child: BottomNavigationBar(
    );
  }
}
