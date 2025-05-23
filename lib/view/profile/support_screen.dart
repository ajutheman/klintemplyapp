import 'package:flutter/material.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getPixelWidth(20)),
              child: Column(
                children: [
                  getVerSpace(FetchPixels.getPixelHeight(20)),
                  gettoolbarMenu(context, "back.svg", () {
                    Constant.backToPrev(context);
                  },
                      istext: true,
                      title: "Support",
                      weight: FontWeight.w800,
                      fontsize: 24,
                      textColor: Colors.black),
                  getVerSpace(FetchPixels.getPixelHeight(30)),
                  // getMultilineCustomFont(
                  //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare neque in eros aliquet, eget mollis leo egestas. Sed commodo efficitur eleifend. Nunc pharetra fermentum nunc, eu hendrerit purus blandit et. Nam quam lorem, rutrum nec velit a, egestas tristique nibh. Ut hendrerit tristique nibh quis hendrerit. Sed a felis nec mi maximus aliquam at ac ipsum. Cras tristique mattis augue at auctor. Nullam placerat ultrices purus non tincidunt. Nullam eget purus id urna venenatis dignissim nec id nunc. Sed condimentum arcu quis efficitur feugiat. Cras nisi felis, malesuada et tempus et, pellentesque vitae ligula. Etiam feugiat tellus nunc, nec vestibulum arcu bibendum sed. Phasellus nisi nisi, mollis vitae nibh non, dictum laoreet justo. Duis porta, velit id dictum finibus, eros sem condimentum diam, vitae blandit dui neque vel nisl. Integer hendrerit purus in nunc hendrerit, id ultrices leo auctor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Donec vulputate urna eget nisl scelerisque tempor. Morbi semper orci metus. Cras aliquet auctor enim, ac rutrum velit. Quisque nulla augue, cursus at nulla at, egestas imperdiet libero. Nullam sollicitudin sapien sit amet massa mattis ullamcorper eu non risus. Nulla turpis lorem, tristique a dictum sed, fermentum ut lorem. In vitae scelerisque nibh.",
                  //     16,
                  //     Colors.black,
                  //     fontWeight: FontWeight.w400,
                  //     txtHeight: FetchPixels.getPixelHeight(1.3))
                  Text(
                    "If you have any questions or need assistance, feel free to chat with us on WhatsApp. Our support team is ready to help you 24/7.",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  Container(
                    margin: EdgeInsets.all(18),
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _openWhatsApp(context, "+971501887853");
                      },
                      icon: Icon(Icons.chat, color: Colors.white),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Chat on WhatsApp", style: TextStyle(fontSize: 16)),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFF077975),
                        foregroundColor: Colors.white,
                        minimumSize: Size(160, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
            Center(
              child: Text(
                "Or reach us at support@example.com\nCall us: +971 50 188 7853",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),)
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          Constant.backToPrev(context);
          return false;
        });
  }
}
void _openWhatsApp(BuildContext context, String phoneNumber) async {
  final String message = Uri.encodeComponent("Hello, I need support regarding your services.");
  final Uri url = Uri.parse("https://wa.me/971501887853?text=$message");

  // Check if the URL can be launched
  if (await canLaunchUrl(url)) {
    final bool success = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!success) {
      _showSnackBar(context, "Could not open WhatsApp. Please try again.");
    }
  } else {
    _showSnackBar(context, "WhatsApp is not available on this device.");
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.cyan,
    ),
  );
}