// // import 'package:flutter/material.dart';
// //
// // // import 'package:flutter_slidable/flutter_slidable.dart';
// // // import 'package:provider_man_app/base/color_data.dart';
// // import '../../../base/resizer/fetch_pixels.dart';
// // import '../../../base/widget_utils.dart';
// // import '../../base/color_data.dart';
// // import '../../models/model_booking.dart';
// //
// // class BookingDetailsScreen extends StatefulWidget {
// //   final ModelBooking booking;
// //
// //   const BookingDetailsScreen({Key? key, required this.booking})
// //       : super(key: key);
// //
// //   @override
// //   State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
// // }
// //
// // class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
// //   late ModelBooking modelBooking;
// //   late int currentStatusIndex;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     modelBooking = widget.booking;
// //     currentStatusIndex =
// //         ModelBooking.bookingStatuses.indexOf(modelBooking.status!);
// //   }
// //
// //   void updateStatus() {
// //     setState(() {
// //       if (currentStatusIndex < ModelBooking.bookingStatuses.length - 1) {
// //         currentStatusIndex++;
// //         modelBooking.status = ModelBooking.bookingStatuses[currentStatusIndex];
// //       }
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(height: 20),
// //             const Align(
// //               child: Text(
// //                 "Booking ID 26556",
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             Align(
// //               child: Container(
// //                 height: FetchPixels.getPixelHeight(60),
// //                 width: FetchPixels.getPixelHeight(60),
// //                 decoration: BoxDecoration(
// //                     image: getDecorationAssetImage(
// //                         context, modelBooking.image ?? "")),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             _infoColumn("Customer Name", modelBooking.providerName ?? 'User'),
// //             _infoColumn("Address", "1901 Thornridge Cir. Shiloh, Hawaii 81063"),
// //             _infoRow("Booking For", modelBooking.serviceName ?? 'Cleaning'),
// //             _infoRow("Rooms", modelBooking.noOfRooms ?? '0'),
// //             _infoRow("SquareFeet", modelBooking.squareFeet ?? '0'),
// //             _infoRow("Date", modelBooking.date ?? ''),
// //             _infoRow("Start Time", modelBooking.startTime ?? ''),
// //             _infoRow("End Time", modelBooking.endTime ?? ''),
// //             _infoRow("Total Time", "2 Hrs"),
// //             _infoRow("Price", "100"),
// //             _infoRow("PaymentStatus", "Paid"),
// //             const SizedBox(height: 30),
// //             _statusSlider(),
// //             const Spacer(),
// //             /*Row(
// //               children: [
// //                 Expanded(
// //                   child: OutlinedButton(
// //                     onPressed: () {},
// //                     style: OutlinedButton.styleFrom(
// //                       padding: const EdgeInsets.symmetric(vertical: 14),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       "Cancel",
// //                       style: TextStyle(fontSize: 16, color: Colors.black),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       setState(() {
// //                         modelBooking.status =
// //                         ModelBooking.bookingStatuses[currentStatusIndex];
// //                       });
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.blue,
// //                       padding: const EdgeInsets.symmetric(vertical: 14),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       "Accept",
// //                       style: TextStyle(fontSize: 16, color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),*/
// //             const SizedBox(height: 30),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _infoRow(String title, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(color: Colors.grey, fontSize: 12),
// //           ),
// //           const SizedBox(width: 20),
// //           Text(
// //             value,
// //             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _infoColumn(String title, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(color: Colors.grey, fontSize: 12),
// //           ),
// //           const SizedBox(width: 20),
// //           Text(
// //             value,
// //             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   double _dragPosition = 0.0; // Tracks the drag movement
// //
// //   Widget _statusSlider() {
// //     bool isCompleted = modelBooking.status == "Completed";
// //
// //     return Column(
// //       children: [
// //         if (!isCompleted)
// //           GestureDetector(
// //             onHorizontalDragUpdate: (details) {
// //               setState(() {
// //                 _dragPosition += details.primaryDelta!;
// //                 _dragPosition =
// //                     _dragPosition.clamp(0.0, 200.0); // Keep within bounds
// //               });
// //             },
// //             onHorizontalDragEnd: (details) {
// //               if (_dragPosition > 180) {
// //                 // Ensure proper drag distance
// //                 if (currentStatusIndex <
// //                     ModelBooking.bookingStatuses.length - 1) {
// //                   setState(() {
// //                     currentStatusIndex++;
// //                     modelBooking.status =
// //                         ModelBooking.bookingStatuses[currentStatusIndex];
// //                   });
// //                 }
// //               }
// //               setState(() => _dragPosition = 0); // Reset after each slide
// //             },
// //             child: Stack(
// //               alignment: Alignment.centerLeft,
// //               children: [
// //                 Container(
// //                   width: double.infinity,
// //                   height: 50,
// //                   decoration: BoxDecoration(
// //                     color: greenColor,
// //                     borderRadius: BorderRadius.circular(25),
// //                   ),
// //                   child: Center(
// //                     child: Text(
// //                       "Slide to ${ModelBooking.bookingStatuses[currentStatusIndex + 1]}",
// //                       style: const TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
// //                 AnimatedPositioned(
// //                   duration: const Duration(milliseconds: 200),
// //                   left: _dragPosition,
// //                   child: Container(
// //                     width: 50,
// //                     height: 50,
// //                     decoration: BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       color: Colors.white.withOpacity(0.2),
// //                     ),
// //                     child: const Center(
// //                       child: Icon(Icons.keyboard_double_arrow_right,
// //                           color: Colors.white, size: 24),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           )
// //         else
// //           Container(
// //             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
// //             decoration: BoxDecoration(
// //               color: greenColor,
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //             child: const Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Icon(Icons.check_circle, color: Colors.white),
// //                 SizedBox(width: 8),
// //                 Text(
// //                   "Completed",
// //                   style: TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //               ],
// //             ),
// //           ),
// //       ],
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// // import '../../../data/api_client.dart';
// // import '../../../models/booking_detail.dart';
// // import '../../../repository/booking_repository.dart';
// import 'package:intl/intl.dart';
//
// import '../../repository/api_client.dart';
// import '../home/booking/modle/booking_detail.dart';
// import '../home/booking/repositories/booking_repository.dart';
//
// class BookingDetailsScreen extends StatefulWidget {
//   final int orderId;
//
//   const BookingDetailsScreen({Key? key, required this.orderId})
//       : super(key: key);
//
//   @override
//   State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
// }
//
// class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
//   late BookingRepository repository;
//   BookingDetail? bookingDetail;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     repository = BookingRepository(ApiClient(context));
//     loadBookingDetails();
//   }
//
//   void loadBookingDetails() async {
//     bookingDetail = await repository.fetchBookingDetail(widget.orderId);
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text("Booking Details",
//             style: TextStyle(fontSize: 18, color: Colors.black)),
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Booking ID: ${bookingDetail!.orderNumber}",
//                         style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     _infoRow("Customer Name", bookingDetail!.customerName),
//                     _infoColumn("Address", bookingDetail!.address),
//                     _infoRow("Order Status", bookingDetail!.orderStatus),
//                     _infoRow("Payment Status", bookingDetail!.paymentStatus),
//                     _infoRow(
//                         "Date",
//                         DateFormat('dd MMM yyyy, hh:mm a')
//                             .format(DateTime.parse(bookingDetail!.createdAt))),
//                     _infoRow("Total Price", "AED ${bookingDetail!.total}"),
//                     const SizedBox(height: 20),
//                     const Text("Ordered Items",
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 10),
//                     Column(
//                       children: bookingDetail!.items
//                           .map((item) => _orderItemWidget(item))
//                           .toList(),
//                     ),
//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
//
//   Widget _infoRow(String title, String value) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title,
//                 style: const TextStyle(color: Colors.grey, fontSize: 14)),
//             Expanded(
//               child: Text(value,
//                   textAlign: TextAlign.right,
//                   style: const TextStyle(fontSize: 14)),
//             ),
//           ],
//         ),
//       );
//
//   Widget _infoColumn(String title, String value) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style: const TextStyle(color: Colors.grey, fontSize: 14)),
//             const SizedBox(height: 4),
//             Text(value, style: const TextStyle(fontSize: 14)),
//           ],
//         ),
//       );
//
//   Widget _orderItemWidget(OrderItem item) => Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(item.image,
//                   height: 50, width: 50, fit: BoxFit.cover),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(item.name,
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.bold)),
//                   Text("AED ${item.price}",
//                       style:
//                           const TextStyle(fontSize: 14, color: Colors.green)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/color_data.dart';
import '../../base/openMap.dart';
import '../../base/resizer/fetch_pixels.dart';
import '../../base/widget_utils.dart';
import '../../repository/api_client.dart';
import '../home/booking/modle/booking_detail.dart';
import '../home/booking/repositories/booking_repository.dart';

class BookingDetailsScreen extends StatefulWidget {
  final int orderId;

  const BookingDetailsScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  late BookingRepository repository;
  BookingDetail? bookingDetail;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    repository = BookingRepository(ApiClient(context));
    loadBookingDetails();
  }

  void loadBookingDetails() async {
    bookingDetail = await repository.fetchBookingDetail(widget.orderId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text("Booking Details",
            style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : bookingDetailBody(),
    );
  }

  Widget bookingDetailBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Order #${bookingDetail!.orderNumber}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: greenColor
                      // Colors.teal,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              _infoRow("Customer Name", bookingDetail!.customerName),
              _infoRow("Mobile", bookingDetail!.customerMobile.toString()),
              _infoRow("Email", bookingDetail!.customerEmail),
              _infoColumn("Address", bookingDetail!.address),
              const Divider(thickness: 1),
              _infoRow(
                  "Order Status", bookingDetail!.orderStatus.toUpperCase()),
              _infoRow("Payment Status", bookingDetail!.paymentStatus),
              // _infoRow("Payment Method", bookingDetail!.paymentMethod),
              _infoRow(
                  "Work Status", bookingDetail!.workAssignmentStatus ?? 'N/A'),
              _infoRow("Start Time", formatDateTime(bookingDetail!.startTime)),
              _infoRow("End Time", formatDateTime(bookingDetail!.endTime)),
              _infoRow("Time Taken", getTotalTimeTaken()),
              const Divider(thickness: 1),
              // _infoRow("Subtotal",
              //     "AED ${bookingDetail!.subtotal.toStringAsFixed(2)}"),
              // _infoRow("Tax (${bookingDetail!.taxRate}%)",
              //     "AED ${bookingDetail!.taxAmount.toStringAsFixed(2)}"),
              // _infoRow(
              //     "Total", "AED ${bookingDetail!.total.toStringAsFixed(2)}"),
              _infoRow(
                  "Created At",
                  DateFormat('dd MMM yyyy, hh:mm a')
                      .format(DateTime.parse(bookingDetail!.createdAt))),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchWhatsApp(bookingDetail!.customerMobile
                              .toString()); // Make sure mobile number is valid
                        },
                        child: Container(
                          height: FetchPixels.getPixelHeight(42),
                          width: FetchPixels.getPixelHeight(42),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: FaIcon(FontAwesomeIcons.whatsapp,
                                color: Colors.green),
                          ),
                        ),
                      ),
                      getHorSpace(FetchPixels.getPixelWidth(12)),
                      GestureDetector(
                        onTap: () {
                          launchCall(bookingDetail!.customerMobile.toString());
                        },
                        child: Container(
                          height: FetchPixels.getPixelHeight(42),
                          width: FetchPixels.getPixelHeight(42),
                          decoration: BoxDecoration(
                            image:
                                getDecorationAssetImage(context, "call_bg.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      openMap(
                          bookingDetail!.latitude!, bookingDetail!.longitude!);
                    },
                    // () => Navigator.push(context,
                    // MaterialPageRoute(builder: (_) => const MapScreen())),
                    child: getCustomFont("Location >>", 14, greenColor, 1,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Text("Ordered Items",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              if (bookingDetail!.latitude != null &&
                  bookingDetail!.longitude != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      openMap(
                          bookingDetail!.latitude!, bookingDetail!.longitude!);
                    },
                    icon: const Icon(Icons.location_pin, color: Colors.teal),
                    label: const Text(
                      "View Location on Google Maps",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              ...bookingDetail!.items
                  .map((item) => _orderItemWidget(item))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(width: 16),
            Flexible(
              child: Text(value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      );

  Widget _infoColumn(String title, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 4),
            Text(value,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      );

  // Widget _orderItemWidget(OrderItem item) => Card(
  //       margin: const EdgeInsets.symmetric(vertical: 8),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       elevation: 3,
  //       child: ListTile(
  //         leading: ClipRRect(
  //           borderRadius: BorderRadius.circular(8),
  //           child: Image.network(item.image,
  //               height: 50, width: 50, fit: BoxFit.cover),
  //         ),
  //         title: Text(item.name,
  //             style: const TextStyle(fontWeight: FontWeight.bold)),
  //         subtitle: Text("AED ${item.price.toStringAsFixed(2)}",
  //             style: const TextStyle(color: Colors.green)),
  //       ),
  //     );
  Widget _orderItemWidget(OrderItem item) => Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(item.image,
                        height: 50, width: 50, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(item.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _infoRow("Price", "AED ${item.price.toStringAsFixed(2)}"),
              _infoRow(
                  "Base Price", "AED ${item.basePrice.toStringAsFixed(2)}"),
              _infoRow("Extra Employee Cost",
                  "AED ${item.additionalEmployeeCost.toStringAsFixed(2)}"),
              _infoRow("Employee Count", "${item.employeeCount}"),
              _infoRow("Type", item.type),
              _infoRow("Subscription (x per week)",
                  item.subscriptionFrequency.toString()),
            ],
          ),
        ),
      );

  String formatDateTime(String? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      return DateFormat('dd MMM yyyy, hh:mm a')
          .format(DateTime.parse(dateTime));
    } catch (_) {
      return dateTime;
    }
  }

  String getTotalTimeTaken() {
    if (bookingDetail!.startTime != null && bookingDetail!.endTime != null) {
      final start = DateTime.tryParse(bookingDetail!.startTime!);
      final end = DateTime.tryParse(bookingDetail!.endTime!);
      if (start != null && end != null) {
        final diff = end.difference(start);
        return "${diff.inHours}h ${diff.inMinutes.remainder(60)}m";
      }
    }
    return 'N/A';
  }
}

Future<void> openMap(double lat, double lng) async {
  final googleMapsUrl =
      Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');

  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open Google Maps.';
  }
}
