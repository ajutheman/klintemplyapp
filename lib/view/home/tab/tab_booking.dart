// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../base/color_data.dart';
// import '../../../base/resizer/fetch_pixels.dart';
// import '../../../base/widget_utils.dart';
// import '../../../bloc/profile/profile_bloc.dart';
// // import '../../../bloc/profile/profile_event.dart';
// // import '../../../bloc/profile/profile_state.dart';
// import '../../../data/data_file.dart';
// import '../../../data/prefs.dart';
// import '../../../models/model_booking.dart';
// import '../../../repository/profile_repository.dart';
// // import '../../../utils/prefs.dart';
// import '../../details/booking_details.dart';
// import '../../map_screen.dart';
//
// class TabBooking extends StatefulWidget {
//   const TabBooking({Key? key}) : super(key: key);
//
//   @override
//   State<TabBooking> createState() => _TabBookingState();
// }
//
// class _TabBookingState extends State<TabBooking> {
//   List<ModelBooking> bookingLists = DataFile.bookingList;
//   SharedPreferences? selection;
//
//   @override
//   void initState() {
//     super.initState();
//     SharedPreferences.getInstance().then((SharedPreferences sp) {
//       selection = sp;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     FetchPixels(context);
//     return BlocProvider(
//       create: (context) {
//         final bloc = ProfileBloc(repository: ProfileRepository(context));
//         Prefs.getToken().then((storedToken) {
//           if (storedToken != null) {
//             bloc.add(LoadProfile(storedToken));
//           }
//         });
//         return bloc;
//       },
//       child: SafeArea(
//         child: Column(
//           children: [
//             getVerSpace(FetchPixels.getPixelHeight(16)),
//             BlocBuilder<ProfileBloc, ProfileState>(
//               builder: (context, state) {
//                 if (state is ProfileLoaded) {
//                   return userProfileHeader(state.employee);
//                 } else if (state is ProfileLoading) {
//                   return Padding(
//                     padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
//                     child: const Center(child: CircularProgressIndicator()),
//                   );
//                 } else {
//                   return defaultUserProfileHeader();
//                 }
//               },
//             ),
//             getVerSpace(FetchPixels.getPixelHeight(30)),
//             bookingLists.isEmpty ? nullListView() : bookingList(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Expanded nullListView() {
//     return Expanded(
//         flex: 1,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             getSvgImage("booking_null.svg",
//                 height: FetchPixels.getPixelHeight(124),
//                 width: FetchPixels.getPixelHeight(84.77)),
//             getVerSpace(FetchPixels.getPixelHeight(30)),
//             getCustomFont("No Bookings Yet!", 20, Colors.black, 1,
//                 fontWeight: FontWeight.w800)
//           ],
//         ));
//   }
//
//   Expanded bookingList() {
//     return Expanded(
//       flex: 1,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         padding:
//             EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//         shrinkWrap: true,
//         primary: true,
//         itemCount: bookingLists.length,
//         itemBuilder: (context, index) {
//           ModelBooking modelBooking = bookingLists[index];
//           return Column(
//             children: [
//               dateHeader(modelBooking, index, context),
//               getVerSpace(FetchPixels.getPixelHeight(10)),
//               GestureDetector(
//                 child: Container(
//                   margin:
//                       EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: const [
//                         BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 10,
//                             offset: Offset(0.0, 4.0)),
//                       ],
//                       borderRadius: BorderRadius.circular(
//                           FetchPixels.getPixelHeight(12))),
//                   padding: EdgeInsets.symmetric(
//                       horizontal: FetchPixels.getPixelWidth(16),
//                       vertical: FetchPixels.getPixelHeight(16)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           getCustomFont(modelBooking.serviceName ?? "", 16,
//                               Colors.black, 1,
//                               fontWeight: FontWeight.w800),
//                           Row(
//                             children: [
//                               /*getSvgImage("check_complete.svg",
//                                   width: FetchPixels.getPixelHeight(24),
//                                   height:
//                                       FetchPixels.getPixelHeight(24)),
//                               getHorSpace(FetchPixels.getPixelWidth(6)),*/
//                               getStatusBadge(modelBooking.status ?? "")
//                             ],
//                           )
//                         ],
//                       ),
//                       getVerSpace(FetchPixels.getPixelHeight(6)),
//                       Row(
//                         children: [
//                           getCustomFont(
//                               modelBooking.startTime ?? "", 14, textColor, 1,
//                               fontWeight: FontWeight.w400),
//                           getCustomFont(" - ", 14, textColor, 1,
//                               fontWeight: FontWeight.w400),
//                           getCustomFont(
//                               modelBooking.endTime ?? "", 14, textColor, 1,
//                               fontWeight: FontWeight.w400),
//                         ],
//                       ),
//                       getVerSpace(FetchPixels.getPixelHeight(5)),
//                       getCustomFont('${modelBooking.noOfRooms ?? ""} Rooms', 14,
//                           textColor, 1,
//                           fontWeight: FontWeight.w400),
//                       getVerSpace(FetchPixels.getPixelHeight(5)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           getCustomFont(
//                               'Square Feet - ${modelBooking.squareFeet ?? ""}',
//                               14,
//                               textColor,
//                               1,
//                               fontWeight: FontWeight.w400),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const MapScreen()), // Open the map screen
//                               );
//                             },
//                             child: getCustomFont(
//                               'Location >>',
//                               14,
//                               greenColor,
//                               1,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       getVerSpace(FetchPixels.getPixelHeight(20)),
//                       getDivider(dividerColor, 0, 1),
//                       getVerSpace(FetchPixels.getPixelHeight(20)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Hero(
//                                 tag: index,
//                                 child: Container(
//                                   height: FetchPixels.getPixelHeight(42),
//                                   width: FetchPixels.getPixelHeight(42),
//                                   decoration: BoxDecoration(
//                                       image: getDecorationAssetImage(
//                                           context, modelBooking.image ?? "")),
//                                 ),
//                               ),
//                               getHorSpace(FetchPixels.getPixelWidth(9)),
//                               getCustomFont(modelBooking.providerName ?? "", 16,
//                                   Colors.black, 1,
//                                   fontWeight: FontWeight.w400)
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 height: FetchPixels.getPixelHeight(42),
//                                 width: FetchPixels.getPixelHeight(42),
//                                 decoration: BoxDecoration(
//                                   color: Colors
//                                       .green[50], // Light WhatsApp background
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Center(
//                                   child: FaIcon(
//                                     FontAwesomeIcons
//                                         .whatsapp, // ✅ WhatsApp Icon
//                                     color: Colors.green,
//                                     size: FetchPixels.getPixelHeight(24),
//                                   ),
//                                 ),
//                               ),
//                               getHorSpace(FetchPixels.getPixelWidth(12)),
//                               Container(
//                                 height: FetchPixels.getPixelHeight(42),
//                                 width: FetchPixels.getPixelHeight(42),
//                                 decoration: BoxDecoration(
//                                     image: getDecorationAssetImage(
//                                         context, "call_bg.png")),
//                               ),
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   selection!.setInt("index", index);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => BookingDetailsScreen(
//                               orderId: 1,
//                             )
//                         // booking: bookingLists[index]), // Use bookingLists
//                         ),
//                   );
//                 },
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Expanded bookingList() {
//   //   return Expanded(
//   //     flex: 1,
//   //     child: ListView.builder(
//   //       physics: const BouncingScrollPhysics(),
//   //       padding:
//   //           EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//   //       shrinkWrap: true,
//   //       primary: true,
//   //       itemCount: bookingLists.length,
//   //       itemBuilder: (context, index) {
//   //         ModelBooking modelBooking = bookingLists[index];
//   //         return
//   //           // Row(
//   //           Column(
//   //           children: [
//   //             dateHeader(modelBooking, index, context),
//   //             getVerSpace(FetchPixels.getPixelHeight(10)),
//   //             GestureDetector(
//   //               onTap: () {
//   //                 selection?.setInt("index", index);
//   //                 Navigator.push(
//   //                   context,
//   //                   MaterialPageRoute(
//   //                     builder: (context) => BookingDetailsScreen(
//   //                       booking: bookingLists[index],
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //               child: Container(
//   //                 margin:
//   //                     EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
//   //                 padding: EdgeInsets.symmetric(
//   //                     horizontal: FetchPixels.getPixelWidth(16),
//   //                     vertical: FetchPixels.getPixelHeight(16)),
//   //                 decoration: BoxDecoration(
//   //                   color: Colors.white,
//   //                   boxShadow: const [
//   //                     BoxShadow(
//   //                         color: Colors.black12,
//   //                         blurRadius: 10,
//   //                         offset: Offset(0.0, 4.0)),
//   //                   ],
//   //                   borderRadius:
//   //                       BorderRadius.circular(FetchPixels.getPixelHeight(12)),
//   //                 ),
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     getCustomFont(
//   //                         modelBooking.serviceName ?? "", 16, Colors.black, 1,
//   //                         fontWeight: FontWeight.w800),
//   //                     getVerSpace(FetchPixels.getPixelHeight(6)),
//   //                     getCustomFont(
//   //                         "${modelBooking.startTime} - ${modelBooking.endTime}",
//   //                         14,
//   //                         textColor,
//   //                         1,
//   //                         fontWeight: FontWeight.w400),
//   //                     getVerSpace(FetchPixels.getPixelHeight(5)),
//   //                     getCustomFont(
//   //                         '${modelBooking.noOfRooms} Rooms', 14, textColor, 1),
//   //                     getVerSpace(FetchPixels.getPixelHeight(20)),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
//   Widget getStatusBadge(String status) {
//     Color statusColor;
//
//     switch (status) {
//       case "Pending":
//         statusColor = Colors.orange;
//         break;
//       case "Completed":
//         statusColor = greenColor;
//         break;
//       case "Started":
//         statusColor = Colors.blue;
//         break;
//       case "Travelling":
//         statusColor = Colors.purple;
//         break;
//       default:
//         statusColor = Colors.grey;
//     }
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: statusColor.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: getCustomFont(
//         status,
//         14,
//         statusColor,
//         1,
//         fontWeight: FontWeight.w600,
//       ),
//     );
//   }
//
//   Widget userProfileHeader(employee) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: FetchPixels.getPixelHeight(23),
//             backgroundImage: NetworkImage(employee.image),
//           ),
//           getHorSpace(FetchPixels.getPixelWidth(12)),
//           getCustomFont(employee.name, 16, Colors.black, 1,
//               fontWeight: FontWeight.w400)
//         ],
//       ),
//     );
//   }
//
//   Widget defaultUserProfileHeader() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//       child: Row(
//         children: [
//           Container(
//             height: FetchPixels.getPixelHeight(46),
//             width: FetchPixels.getPixelHeight(46),
//             decoration: BoxDecoration(
//                 image: getDecorationAssetImage(context, "profile.png")),
//           ),
//           getHorSpace(FetchPixels.getPixelWidth(12)),
//           getCustomFont("Loading...", 16, Colors.black, 1,
//               fontWeight: FontWeight.w400)
//         ],
//       ),
//     );
//   }

//   Widget dateHeader(
//       ModelBooking modelBooking, int index, BuildContext context) {
//     // Ensure `day` is correctly formatted in `dd-MM-yyyy`
//     DateTime? bookingDate;
//     if (modelBooking.day != null && modelBooking.day!.contains("-")) {
//       try {
//         bookingDate = DateFormat('dd-MM-yyyy').parse(modelBooking.day!);
//       } catch (e) {
//         bookingDate = DateTime.now();
//       }
//     } else {
//       bookingDate = DateTime.now();
//       modelBooking.day = DateFormat('dd-MM-yyyy').format(bookingDate);
//     }
//
//     // Get today's and yesterday's date
//     DateTime today = DateTime.now();
//     DateTime yesterday = today.subtract(Duration(days: 1));
//
//     // Format dates properly
//     String formattedBookingDate = DateFormat('dd-MM-yyyy').format(bookingDate);
//     String formattedToday = DateFormat('dd-MM-yyyy').format(today);
//     String formattedYesterday = DateFormat('dd-MM-yyyy').format(yesterday);
//
//     // Determine label
//     String displayDate;
//     if (formattedBookingDate == formattedToday) {
//       displayDate = "Today";
//     } else if (formattedBookingDate == formattedYesterday) {
//       displayDate = "Yesterday";
//     } else {
//       displayDate = formattedBookingDate; // Show actual date
//     }
//
//     // Ensure the date header appears **only above the first booking of that day**
//     bool showDateHeader =
//         index == 0 || bookingLists[index - 1].day != modelBooking.day;
//
//     return showDateHeader
//         ? Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Show "Bookings" title only for the first index
//               index == 0
//                   ? getCustomFont("Bookings", 16, Colors.black, 1,
//                       fontWeight: FontWeight.w800)
//                   : Container(),
//
//               // Always show Date Picker on the right
//               Row(
//                 children: [
//                   getCustomFont(
//                     displayDate, // Now correctly handles Yesterday
//                     14,
//                     Colors.black,
//                     1,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.calendar_month, size: 16),
//                     onPressed: () async {
//                       DateTime? selectedDate = await showDatePicker(
//                         context: context,
//                         initialDate: bookingDate,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                       );
//
//                       if (selectedDate != null) {
//                         modelBooking.day =
//                             DateFormat('dd-MM-yyyy').format(selectedDate);
//                         (context as Element)
//                             .markNeedsBuild(); // Force UI update
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           )
//         : Container();
//   }
// }
//
// // Expanded nullListView() {
// //   return Expanded(
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         getSvgImage("booking_null.svg",
// //             height: FetchPixels.getPixelHeight(124),
// //             width: FetchPixels.getPixelHeight(84.77)),
// //         getVerSpace(FetchPixels.getPixelHeight(30)),
// //         getCustomFont("No Bookings Yet!", 20, Colors.black, 1,
// //             fontWeight: FontWeight.w800)
// //       ],
// //     ),
// //   );
// // }
// //
// // Expanded bookingList() {
// //   return Expanded(
// //     child: ListView.builder(
// //       physics: const BouncingScrollPhysics(),
// //       padding:
// //       EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
// //       itemCount: bookingLists.length,
// //       itemBuilder: (context, index) {
// //         final modelBooking = bookingLists[index];
// //         return Column(
// //           children: [
// //             dateHeader(modelBooking, index, context),
// //             getVerSpace(FetchPixels.getPixelHeight(10)),
// //             GestureDetector(
// //               onTap: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) =>
// //                         BookingDetailsScreen(booking: modelBooking),
// //                   ),
// //                 );
// //               },
// //               child: Container(
// //                 margin:
// //                 EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
// //                 decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     boxShadow: const [
// //                       BoxShadow(
// //                           color: Colors.black12,
// //                           blurRadius: 10,
// //                           offset: Offset(0.0, 4.0)),
// //                     ],
// //                     borderRadius: BorderRadius.circular(
// //                         FetchPixels.getPixelHeight(12))),
// //                 padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         getCustomFont(
// //                             modelBooking.serviceName ?? "", 16, Colors.black, 1,
// //                             fontWeight: FontWeight.w800),
// //                         getStatusBadge(modelBooking.status ?? "")
// //                       ],
// //                     ),
// //                     getVerSpace(FetchPixels.getPixelHeight(6)),
// //                     Row(
// //                       children: [
// //                         getCustomFont(
// //                             "${modelBooking.startTime} - ${modelBooking.endTime}",
// //                             14,
// //                             textColor,
// //                             1,
// //                             fontWeight: FontWeight.w400),
// //                       ],
// //                     ),
// //                     getVerSpace(FetchPixels.getPixelHeight(5)),
// //                     getCustomFont("${modelBooking.noOfRooms} Rooms", 14,
// //                         textColor, 1, fontWeight: FontWeight.w400),
// //                     getVerSpace(FetchPixels.getPixelHeight(5)),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         getCustomFont(
// //                             "Square Feet - ${modelBooking.squareFeet}",
// //                             14,
// //                             textColor,
// //                             1,
// //                             fontWeight: FontWeight.w400),
// //                         GestureDetector(
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (context) => const MapScreen(),
// //                               ),
// //                             );
// //                           },
// //                           child: getCustomFont("Location >>", 14, greenColor, 1,
// //                               fontWeight: FontWeight.w600),
// //                         ),
// //                       ],
// //                     ),
// //                     getVerSpace(FetchPixels.getPixelHeight(20)),
// //                     getDivider(dividerColor, 0, 1),
// //                     getVerSpace(FetchPixels.getPixelHeight(20)),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Row(
// //                           children: [
// //                             // CircleAvatar(
// //                             //   radius: FetchPixels.getPixelHeight(21),
// //                             //   backgroundImage: getAssetImageProvider(
// //                             //       modelBooking.image ?? ""),
// //                             // ),
// //                             getHorSpace(FetchPixels.getPixelWidth(9)),
// //                             getCustomFont(modelBooking.providerName ?? "", 16,
// //                                 Colors.black, 1,
// //                                 fontWeight: FontWeight.w400)
// //                           ],
// //                         ),
// //                         Row(
// //                           children: [
// //                             Container(
// //                               height: FetchPixels.getPixelHeight(42),
// //                               width: FetchPixels.getPixelHeight(42),
// //                               decoration: BoxDecoration(
// //                                 color: Colors.green[50],
// //                                 shape: BoxShape.circle,
// //                               ),
// //                               child: Center(
// //                                 child: FaIcon(FontAwesomeIcons.whatsapp,
// //                                     color: Colors.green,
// //                                     size: FetchPixels.getPixelHeight(24)),
// //                               ),
// //                             ),
// //                           ],
// //                         )
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     ),
// //   );
// // }
// // }
// //

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/color_data.dart';
import '../../../base/openMap.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../../bloc/booking/booking_bloc.dart';
import '../../../bloc/booking/booking_event.dart';
import '../../../bloc/booking/booking_state.dart';
// import '../../../data/api_client.dart';
// import '../../../models/booking.dart';
// import '../../../repository/booking_repository.dart';
import '../../../bloc/profile/profile_bloc.dart';
import '../../../data/prefs.dart';
import '../../../repository/api_client.dart';
import '../../../repository/profile_repository.dart';
import '../../details/booking_details.dart';
import '../booking/Widget/statusDropdown.dart';
import '../booking/modle/booking.dart';
import '../booking/repositories/booking_repository.dart';
import 'new test /BookingListWidget.dart' show BookingListWidget;
// import '../booking/repositories/booking_repository.dart';
// import '../booking/modle/repositories/booking_repository.dart';

class TabBooking extends StatefulWidget {
  const TabBooking({Key? key}) : super(key: key);

  @override
  State<TabBooking> createState() => _TabBookingState();
}

class _TabBookingState extends State<TabBooking> {
  SharedPreferences? selection;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      selection = sp;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);

    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) {
        //     final apiClient = ApiClient(context);
        //     return BookingBloc(BookingRepository(apiClient))
        //       ..add(LoadBookings(
        //           date:DateFormat('YYYY-MM-DD').format(selectedDate!)
        //           // DateFormat('yyyy-MM-dd').format(DateTime.now())
        //       )
        //       );
        //
        //   },
        // ),
        BlocProvider(
          create: (context) {
            final apiClient = ApiClient(context);
            final repository = BookingRepository(apiClient);
            final DateTime selected = selectedDate ?? DateTime.now();
            final String formatted = DateFormat('yyyy-MM-dd').format(selected);
            return BookingBloc(repository)..add(LoadBookings(date: formatted));
          },
        ),

        BlocProvider(create: (context) {
          final bloc = ProfileBloc(repository: ProfileRepository(context));
          Prefs.getToken().then((storedToken) {
            if (storedToken != null) {
              bloc.add(LoadProfile(storedToken));
            }
          });
          return bloc;
        }),
      ],
      child: BlocBuilder<BookingBloc, BookingState>(builder: (context, bookState) {
        return SafeArea(
          child: Column(
            children: [
              getVerSpace(FetchPixels.getPixelHeight(16)),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return userProfileHeader(state.employee);
                  } else if (state is ProfileLoading) {
                    return Padding(
                      padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return defaultUserProfileHeader();
                  }
                },
              ),
              getVerSpace(FetchPixels.getPixelHeight(16)),
              getCustomFont("Bookings", 18, Colors.black, 1, fontWeight: FontWeight.bold),
              getVerSpace(FetchPixels.getPixelHeight(16)),
              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate != null ? "Showing: ${DateFormat('dd MMM yyyy').format(selectedDate!)}" : "Select a Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.calendar_today),
                      label: const Text("Pick Date"),
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                          final formatted = DateFormat('yyyy-MM-dd').format(picked);
                          context.read<BookingBloc>().add(LoadBookings(date: formatted));
                        }
                      },
                    ),
                  ],
                ),
              ),

              //

              // Expanded(
              //   child: BlocBuilder<BookingBloc, BookingState>(
              //     builder: (context, state) {
              //       print('🔥 BookingBloc UI updated with state: $state');
              //
              //       if (state is BookingLoading) {
              //         return const Center(child: CircularProgressIndicator());
              //       } else if (state is BookingLoaded) {
              //         return bookingList(state.bookings);
              //       } else if (state is BookingError) {
              //         return Center(
              //             child: Text('Error: ${state.message}',
              //                 style: const TextStyle(color: Colors.red)));
              //       } else {
              //         return const Center(child: Text('No bookings available.'));
              //       }
              //     },
              //   ),
              // ),

              Expanded(
                child: BookingListWidget(
                  blocContext: context,
                  selectedDate: selectedDate, // 👈 pass date to show in empty screen
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget bookingList(List<Booking> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getSvgImage("booking_null.svg", height: FetchPixels.getPixelHeight(124), width: FetchPixels.getPixelHeight(84.77)),
            getVerSpace(FetchPixels.getPixelHeight(30)),
            getCustomFont("No Bookings Yet!", 20, Colors.black, 1, fontWeight: FontWeight.w800),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingDetailsScreen(orderId: booking.id),
              ),
            );
          },
          // GestureDetector(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) => BookingDetailsScreen(booking: booking)),
          //   );
          // },
          child: Container(
            margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
            padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12)),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont("Order: ${booking.orderNumber}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
                    getStatusBadge(booking.orderStatus),
                  ],
                ),
                getVerSpace(FetchPixels.getPixelHeight(8)),
                getCustomFont("Customer: ${booking.customerName}", 14, textColor, 1),
                getCustomFont("staus: ${booking.orderStatus}", 14, textColor, 1),
                getVerSpace(FetchPixels.getPixelHeight(5)),
                getCustomFont("Total: AED ${booking.total}", 14, textColor, 1),
                getVerSpace(FetchPixels.getPixelHeight(5)),
                getCustomFont(DateFormat('dd MMM yyyy, hh:mm a').format(booking.createdAt), 14, textColor, 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont("Order: ${booking.id}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
                    statusDropdown(context, booking),
                    // <-- Add Dropdown here
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     getCustomFont(
                //         "Order ID:t${booking.id}", 14, Colors.black, 1,
                //         fontWeight: FontWeight.w600),
                //     getStatusBadge(booking.workAssignmentStatus),
                //   ],
                // ),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont("orderStatus : ${booking.orderStatus}", 14, Colors.black, 1, fontWeight: FontWeight.w600),
                    // getStatusBadge(booking.workAssignmentStatus),
                  ],
                ),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont("Order Items Count : ${booking.orderItemsCount}", 14, Colors.black, 1, fontWeight: FontWeight.w600),
                    // getStatusBadge(booking.workAssignmentStatus),
                  ],
                ),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont("Payment Status : ${booking.paymentStatus}", 14, Colors.black, 1, fontWeight: FontWeight.w600),
                    // getStatusBadge(booking.workAssignmentStatus),
                  ],
                ),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont(
                        // "Work Assignment Status : ${booking.workAssignmentStatus}",
                        "Work Assignment Status : ${booking.workAssignment.status}",
                        14,
                        Colors.black,
                        1,
                        fontWeight: FontWeight.w600),
                    // getStatusBadge(booking.workAssignmentStatus),
                  ],
                ),

                if (booking.workAssignment.startTime != null) getCustomFont("Start Time: ${booking.workAssignment.startTime}", 14, Colors.black, 1, fontWeight: FontWeight.w500),

                if (booking.workAssignment.endTime != null) getCustomFont("End Time: ${booking.workAssignment.endTime}", 14, Colors.black, 1, fontWeight: FontWeight.w500),

                getVerSpace(FetchPixels.getPixelHeight(10)),
                if (booking.workAssignment.startTime != null && booking.workAssignment.endTime != null) ...[
                  getCustomFont("Start Time: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.startTime!)}", 14, Colors.black, 1),
                  getVerSpace(5),
                  getCustomFont("End Time: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.endTime!)}", 14, Colors.black, 1),
                  getVerSpace(5),
                  getCustomFont("Total Time: ${_getTotalTimeTaken(booking.workAssignment.startTime!, booking.workAssignment.endTime!)}", 14, Colors.black, 1),
                ],

                getVerSpace(FetchPixels.getPixelHeight(20)),
                getDivider(dividerColor, 0, 1),
                getVerSpace(FetchPixels.getPixelHeight(20)),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchWhatsApp(booking.customerName); // Make sure mobile number is valid
                      },
                      child: Container(
                        height: FetchPixels.getPixelHeight(42),
                        width: FetchPixels.getPixelHeight(42),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                        ),
                      ),
                    ),
                    getHorSpace(FetchPixels.getPixelWidth(12)),
                    GestureDetector(
                      onTap: () {
                        launchCall(booking.customerName);
                      },
                      child: Container(
                        height: FetchPixels.getPixelHeight(42),
                        width: FetchPixels.getPixelHeight(42),
                        decoration: BoxDecoration(
                          image: getDecorationAssetImage(context, "call_bg.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     getCustomFont(
                //         "Order ID: ${booking.id}", 14, Colors.black, 1,
                //         fontWeight: FontWeight.w600),
                //     getStatusBadge(booking.workAssignmentStatus),
                //   ],
                // ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           height: FetchPixels.getPixelHeight(42),
                //           width: FetchPixels.getPixelHeight(42),
                //           decoration: BoxDecoration(
                //             color: Colors.green[50],
                //             shape: BoxShape.circle,
                //           ),
                //           child: const Center(
                //             child: FaIcon(FontAwesomeIcons.whatsapp,
                //                 color: Colors.green),
                //           ),
                //         ),
                //         getHorSpace(FetchPixels.getPixelWidth(12)),
                //         Container(
                //           height: FetchPixels.getPixelHeight(42),
                //           width: FetchPixels.getPixelHeight(42),
                //           decoration: BoxDecoration(
                //               image: getDecorationAssetImage(
                //                   context, "call_bg.png")),
                //         ),
                //       ],
                //     ),
                //     GestureDetector(
                //       onTap: () => Navigator.push(context,
                //           MaterialPageRoute(builder: (_) => const MapScreen())),
                //       child: getCustomFont("Location >>", 14, greenColor, 1,
                //           fontWeight: FontWeight.w600),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getStatusBadge(String status) {
    Color statusColor;

    switch (status.toLowerCase()) {
      case "pending":
        statusColor = Colors.orange;
        break;
      case "completed":
        statusColor = Colors.green;
        break;
      case "confirmed":
        statusColor = Colors.blue;
        break;
      case "started":
        statusColor = Colors.cyan;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: getCustomFont(status.capitalize(), 12, statusColor, 1, fontWeight: FontWeight.w600),
    );
  }

  Widget userProfileHeader(employee) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
      child: Row(
        children: [
          CircleAvatar(
            radius: FetchPixels.getPixelHeight(23),
            backgroundImage: NetworkImage(employee.image),
          ),
          getHorSpace(FetchPixels.getPixelWidth(12)),
          getCustomFont(employee.name, 16, Colors.black, 1, fontWeight: FontWeight.w400)
        ],
      ),
    );
  }

  Widget defaultUserProfileHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
      child: Row(
        children: [
          Container(
            height: FetchPixels.getPixelHeight(46),
            width: FetchPixels.getPixelHeight(46),
            decoration: BoxDecoration(image: getDecorationAssetImage(context, "profile.png")),
          ),
          getHorSpace(FetchPixels.getPixelWidth(12)),
          getCustomFont("Loading...", 16, Colors.black, 1, fontWeight: FontWeight.w400)
        ],
      ),
    );
  }

  // Widget statusDropdown(Booking booking) {
  //   const statuses = [
  //     'pending',
  //     'confirmed',
  //     'in_progress',
  //     'completed',
  //     'cancelled'
  //   ];
  //
  //   return DropdownButton<String>(
  //     value: booking.orderStatus,
  //     underline: const SizedBox(),
  //     borderRadius: BorderRadius.circular(8),
  //     icon: const Icon(Icons.keyboard_arrow_down),
  //     items: statuses.map((String status) {
  //       return DropdownMenuItem<String>(
  //         value: status,
  //         child:
  //             Text(status.capitalize(), style: const TextStyle(fontSize: 14)),
  //       );
  //     }).toList(),
  //     onChanged: (String? newValue) {
  //       if (newValue != null && newValue != booking.orderStatus) {
  //         BlocProvider.of<BookingBloc>(context).add(
  //           UpdateBookingStatus(booking.id, newValue),
  //         );
  //       }
  //     },
  //   );
  // }
}

String _getTotalTimeTaken(DateTime start, DateTime end) {
  final duration = end.difference(start);
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  return '${hours}h ${minutes}m';
}

extension CapExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
