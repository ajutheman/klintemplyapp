import 'package:flutter/material.dart';
// import 'package:provider_man_app/app/data/data_file.dart';
// import 'package:provider_man_app/app/models/model_chat.dart';
// import 'package:provider_man_app/app/routes/app_routes.dart';
// import 'package:provider_man_app/base/constant.dart';
// import 'package:provider_man_app/base/resizer/fetch_pixels.dart';
// import 'package:provider_man_app/base/widget_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../../data/data_file.dart';
import '../../../models/model_chat.dart';
import '../../../routes/app_routes.dart';

class TabChat extends StatefulWidget {
  const TabChat({Key? key}) : super(key: key);

  @override
  State<TabChat> createState() => _TabChatState();
}

class _TabChatState extends State<TabChat> {
  List<ModelChat> chatLists = DataFile.chatList;
  SharedPreferences? chat;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      chat = sp;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return SafeArea(
      child: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        Column(
          children: [
            getVerSpace(FetchPixels.getPixelHeight(20)),
            Align(
              alignment: Alignment.topCenter,
              child: getCustomFont("Chats", 24, Colors.black, 1,
                  fontWeight: FontWeight.w800),
            ),
            getVerSpace(FetchPixels.getPixelHeight(30)),
            chatLists.isEmpty ? nullListView() : chatList()
          ],
        ),
      ),
    );
  }

  Expanded chatList() {
    return Expanded(
        flex: 1,
        child: ListView.builder(
          primary: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: chatLists.length,
          itemBuilder: (context, index) {
            ModelChat modelChat = chatLists[index];
            return GestureDetector(
              onTap: () {
                chat!.setInt("index", index);
                Constant.sendToNext(context, Routes.chatRoute);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
                padding: EdgeInsets.symmetric(
                    horizontal: FetchPixels.getPixelWidth(12),
                    vertical: FetchPixels.getPixelHeight(12)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0.0, 4.0)),
                    ],
                    borderRadius:
                        BorderRadius.circular(FetchPixels.getPixelHeight(12))),
                child: Row(
                  children: [
                    Container(
                      height: FetchPixels.getPixelHeight(56),
                      width: FetchPixels.getPixelHeight(56),
                      decoration: BoxDecoration(
                          image: getDecorationAssetImage(
                              context, modelChat.image ?? "")),
                    ),
                    getHorSpace(FetchPixels.getPixelWidth(12)),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont(
                                  modelChat.name ?? "", 16, Colors.black, 1,
                                  fontWeight: FontWeight.w800),
                              getCustomFont(
                                  modelChat.time ?? "", 14, textColor, 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(5)),
                          getCustomFont(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                              14,
                              textColor,
                              1,
                              fontWeight: FontWeight.w400)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

  Expanded nullListView() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSvgImage("chat_screen.svg",
            height: FetchPixels.getPixelHeight(124),
            width: FetchPixels.getPixelHeight(124)),
        getVerSpace(FetchPixels.getPixelHeight(30)),
        getCustomFont("No Chats Yet!", 20, Colors.black, 1,
            fontWeight: FontWeight.w800)
      ],
    ));
  }
}
