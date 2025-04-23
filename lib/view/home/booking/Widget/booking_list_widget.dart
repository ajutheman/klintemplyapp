// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:kleanitemployeeapp/view/home/booking/Widget/statusDropdown.dart';
// import 'package:kleanitemployeeapp/view/home/tab/tab_booking.dart';
//
// import '../../../../base/color_data.dart';
// import '../../../../base/openMap.dart';
// import '../../../../base/resizer/fetch_pixels.dart';
// import '../../../../base/widget_utils.dart';
// import '../../../details/booking_details.dart';
// import '../modle/booking.dart';
//
// // import '../../../base/color_data.dart';
// // import '../../../base/resizer/fetch_pixels.dart';
// // import '../../../base/widget_utils.dart';
// // import '../../../view/details/booking_details.dart';
// // import '../home/booking/modle/booking.dart';
// // import '../home/booking/Widget/statusDropdown.dart';
// // import '../../../base/openMap.dart';
//
// class BookingListWidget extends StatelessWidget {
//   final List<Booking> bookings;
//
//   const BookingListWidget({Key? key, required this.bookings}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (bookings.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             getSvgImage("booking_null.svg",
//                 height: FetchPixels.getPixelHeight(124),
//                 width: FetchPixels.getPixelHeight(84.77)),
//             getVerSpace(FetchPixels.getPixelHeight(30)),
//             getCustomFont("No Bookings Yet!", 20, Colors.black, 1,
//                 fontWeight: FontWeight.w800),
//           ],
//         ),
//       );
//     }
//
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//       itemCount: bookings.length,
//       itemBuilder: (context, index) {
//         final booking = bookings[index];
//
//         return GestureDetector(
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => BookingDetailsScreen(orderId: booking.id),
//             ),
//           ),
//           child: Container(
//             margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
//             padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12)),
//               boxShadow: const [
//                 BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     getCustomFont("Order: ${booking.orderNumber}", 16, Colors.black, 1,
//                         fontWeight: FontWeight.w800),
//                     getStatusBadge(booking.orderStatus),
//                   ],
//                 ),
//                 getVerSpace(FetchPixels.getPixelHeight(8)),
//                 getCustomFont("Customer: ${booking.customerName}", 14, textColor, 1),
//                 getCustomFont("Status: ${booking.orderStatus}", 14, textColor, 1),
//                 getVerSpace(FetchPixels.getPixelHeight(5)),
//                 getCustomFont("Total: AED ${booking.total}", 14, textColor, 1),
//                 getVerSpace(FetchPixels.getPixelHeight(5)),
//                 getCustomFont(
//                   DateFormat('dd MMM yyyy, hh:mm a').format(booking.createdAt),
//                   14,
//                   textColor,
//                   1,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     getCustomFont("Order ID: ${booking.id}", 14, Colors.black, 1,
//                         fontWeight: FontWeight.w600),
//                     statusDropdown(context, booking),
//                   ],
//                 ),
//                 getVerSpace(FetchPixels.getPixelHeight(10)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     getCustomFont("Order Items: ${booking.orderItemsCount}", 14,
//                         Colors.black, 1, fontWeight: FontWeight.w600),
//                     getCustomFont("Payment: ${booking.paymentStatus}", 14, Colors.black,
//                         1, fontWeight: FontWeight.w600),
//                   ],
//                 ),
//                 getVerSpace(FetchPixels.getPixelHeight(10)),
//                 getCustomFont(
//                     "Work Assignment Status: ${booking.workAssignment.status}",
//                     14,
//                     Colors.black,
//                     1,
//                     fontWeight: FontWeight.w600),
//                 if (booking.workAssignment.startTime != null)
//                   getCustomFont(
//                       "Start: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.startTime!)}",
//                       14,
//                       Colors.black,
//                       1),
//                 if (booking.workAssignment.endTime != null)
//                   getCustomFont(
//                       "End: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.endTime!)}",
//                       14,
//                       Colors.black,
//                       1),
//                 if (booking.workAssignment.startTime != null &&
//                     booking.workAssignment.endTime != null)
//                   getCustomFont(
//                       "Total Time: ${_getTotalTimeTaken(booking.workAssignment.startTime!, booking.workAssignment.endTime!)}",
//                       14,
//                       Colors.black,
//                       1),
//                 getVerSpace(FetchPixels.getPixelHeight(20)),
//                 getDivider(dividerColor, 0, 1),
//                 getVerSpace(FetchPixels.getPixelHeight(20)),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => launchWhatsApp(booking.customerName),
//                       child: Container(
//                         height: FetchPixels.getPixelHeight(42),
//                         width: FetchPixels.getPixelHeight(42),
//                         decoration: BoxDecoration(
//                           color: Colors.green[50],
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Center(
//                           child: FaIcon(FontAwesomeIcons.whatsapp,
//                               color: Colors.green),
//                         ),
//                       ),
//                     ),
//                     getHorSpace(FetchPixels.getPixelWidth(12)),
//                     GestureDetector(
//                       onTap: () => launchCall(booking.customerName),
//                       child: Container(
//                         height: FetchPixels.getPixelHeight(42),
//                         width: FetchPixels.getPixelHeight(42),
//                         decoration: BoxDecoration(
//                           image: getDecorationAssetImage(context, "call_bg.png"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget getStatusBadge(String status) {
//     Color statusColor;
//
//     switch (status.toLowerCase()) {
//       case "pending":
//         statusColor = Colors.orange;
//         break;
//       case "completed":
//         statusColor = Colors.green;
//         break;
//       case "confirmed":
//         statusColor = Colors.blue;
//         break;
//       case "started":
//         statusColor = Colors.cyan;
//         break;
//       default:
//         statusColor = Colors.grey;
//     }
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: statusColor.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: getCustomFont(status.capitalize(), 12, statusColor, 1,
//           fontWeight: FontWeight.w600),
//     );
//   }
//
//   String _getTotalTimeTaken(DateTime start, DateTime end) {
//     final duration = end.difference(start);
//     final hours = duration.inHours;
//     final minutes = duration.inMinutes.remainder(60);
//     return '${hours}h ${minutes}m';
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/color_data.dart';
import '../../../../base/widget_utils.dart';
import '../../../../bloc/booking/booking_state.dart';
import '../../../details/booking_details.dart';
import '../../booking/Widget/statusDropdown.dart';
import '../../booking/modle/booking.dart';

class BookingListWidget extends StatelessWidget {
  final BookingState state;
  final BuildContext blocContext;
  final String? selectedDate;

  const BookingListWidget({
    super.key,
    required this.state,
    required this.blocContext,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    if (state is BookingLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is BookingLoaded) {
      final bookings = (state as BookingLoaded).bookings;

      if (bookings.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getSvgImage("booking_null.svg",
                  height: FetchPixels.getPixelHeight(124),
                  width: FetchPixels.getPixelHeight(84.77)),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getCustomFont(
                selectedDate != null
                    ? "No bookings for ${DateFormat('dd MMM yyyy').format(DateTime.parse(selectedDate!))}"
                    : "No Bookings Yet!",
                16,
                Colors.black,
                1,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingDetailsScreen(orderId: booking.id),
                ),
              );
            },
            child: bookingCard(booking, context),
          );
        },
      );
    } else if (state is BookingError) {
      final error = (state as BookingError).message;
      return Center(
        child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
      );
    } else {
      return const Center(child: Text('No bookings available.'));
    }
  }

  Widget bookingCard(Booking booking, BuildContext context) {
    return Container(
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
              statusDropdown(blocContext, booking),
            ],
          ),
          getVerSpace(FetchPixels.getPixelHeight(8)),
          getCustomFont("Customer: ${booking.customerName}", 14, textColor, 1),
          getCustomFont("Status: ${booking.orderStatus}", 14, textColor, 1),
          getCustomFont("Total: AED ${booking.total}", 14, textColor, 1),
          getCustomFont(
            "Created: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.createdAt)}",
            14,
            textColor,
            1,
          ),
          if (booking.workAssignment.startTime != null)
            getCustomFont("Start: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.startTime!)}", 14, textColor, 1),
          if (booking.workAssignment.endTime != null)
            getCustomFont("End: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.endTime!)}", 14, textColor, 1),
        ],
      ),
    );
  }
}
