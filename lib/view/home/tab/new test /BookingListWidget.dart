// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../../../../base/resizer/fetch_pixels.dart';
// import '../../../../base/color_data.dart';
// import '../../../../base/openMap.dart';
// import '../../../../base/widget_utils.dart';
// import '../../../../bloc/booking/booking_bloc.dart';
// import '../../../../bloc/booking/booking_state.dart';
// import '../../../details/booking_details.dart';
// import '../../booking/Widget/statusDropdown.dart';
// import '../../booking/modle/booking.dart';
// // import '../modle/booking.dart';
// // import '../Widget/statusDropdown.dart';
// // import '../../details/booking_details.dart';
//
// class BookingListWidget extends StatelessWidget {
//   final BookingState state;
//   final BuildContext blocContext;
//
//   const BookingListWidget({super.key, required this.state, required this.blocContext});
//
//   @override
//   Widget build(BuildContext context) {
//     if (state is BookingLoading) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (state is BookingLoaded) {
//       final bookings = state.bookings;
//       if (bookings.isEmpty) {
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               getSvgImage("booking_null.svg",
//                   height: FetchPixels.getPixelHeight(124),
//                   width: FetchPixels.getPixelHeight(84.77)),
//               getVerSpace(FetchPixels.getPixelHeight(30)),
//               getCustomFont("No Bookings Yet!", 20, Colors.black, 1,
//                   fontWeight: FontWeight.w800),
//             ],
//           ),
//         );
//       }
//
//       return ListView.builder(
//         padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           final booking = bookings[index];
//           return GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BookingDetailsScreen(orderId: booking.id),
//               ),
//             ),
//             child: bookingCard(booking, context),
//           );
//         },
//       );
//     } else if (state is BookingError) {
//       return Center(child: Text('Error: ${state.message}', style: const TextStyle(color: Colors.red)));
//     } else {
//       return const Center(child: Text('No bookings available.'));
//     }
//   }
//
//   Widget bookingCard(Booking booking, BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
//       padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12)),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Add your UI here
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               getCustomFont("Order: ${booking.orderNumber}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
//               statusDropdown(blocContext, booking),
//             ],
//           ),
//           // ...rest of the fields like Customer, Total, Dates, Statuses etc
//         ],
//       ),
//     );
//   }
// }

///
// ///
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../../../../base/resizer/fetch_pixels.dart';
// import '../../../../base/color_data.dart';
// import '../../../../base/openMap.dart';
// import '../../../../base/widget_utils.dart';
// import '../../../../bloc/booking/booking_bloc.dart';
// import '../../../../bloc/booking/booking_state.dart';
// import '../../../details/booking_details.dart';
// import '../../booking/Widget/statusDropdown.dart';
// import '../../booking/modle/booking.dart';
//
// class BookingListWidget extends StatelessWidget {
//   final BookingState state;
//   final BuildContext blocContext;
//   final DateTime? selectedDate;
//
//   const BookingListWidget({
//     super.key,
//     required this.state,
//     required this.blocContext,
//     required this.selectedDate,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     if (state is BookingLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//
//     if (state is BookingError) {
//       final error = (state as BookingError).message;
//       return Center(
//         child: Text(
//           'Error: $error',
//           style: const TextStyle(color: Colors.red),
//         ),
//       );
//     }
//
//     if (state is BookingLoaded) {
//       final bookings = (state as BookingLoaded).bookings;
//       if (bookings.isEmpty) {
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               getSvgImage("booking_null.svg",
//                   height: FetchPixels.getPixelHeight(124),
//                   width: FetchPixels.getPixelHeight(84.77)),
//               getVerSpace(FetchPixels.getPixelHeight(20)),
//               getCustomFont(
//                 selectedDate != null
//                     ? "No bookings for ${DateFormat('dd MMM yyyy').format(selectedDate!)}"
//                     : "No Bookings Yet!",
//                 16,
//                 Colors.black,
//                 1,
//                 fontWeight: FontWeight.w600,
//               ),
//             ],
//           ),
//         );
//       }
//
//       return ListView.builder(
//         padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           final booking = bookings[index];
//           return GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BookingDetailsScreen(orderId: booking.id),
//               ),
//             ),
//             child: bookingCard(booking),
//           );
//         },
//       );
//     }
//
//     // fallback UI
//     return const Center(child: Text('No bookings available.'));
//   }
//
//   Widget bookingCard(Booking booking) {
//     return Container(
//       margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
//       padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12)),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               getCustomFont("Order: ${booking.orderNumber}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
//               statusDropdown(blocContext, booking),
//             ],
//           ),
//           getVerSpace(FetchPixels.getPixelHeight(8)),
//           getCustomFont("Customer: ${booking.customerName}", 14, textColor, 1),
//           getCustomFont("Status: ${booking.orderStatus}", 14, textColor, 1),
//           getCustomFont("Payment: ${booking.paymentStatus}", 14, textColor, 1),
//           getCustomFont("Total: AED ${booking.total}", 14, textColor, 1),
//           getCustomFont("Created: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.createdAt)}", 14, textColor, 1),
//
//           if (booking.workAssignment.startTime != null)
//             getCustomFont("Start: ${booking.workAssignment.startTime}", 14, Colors.black, 1),
//
//           if (booking.workAssignment.endTime != null)
//             getCustomFont("End: ${booking.workAssignment.endTime}", 14, Colors.black, 1),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kleanitemployeeapp/view/home/tab/tab_booking.dart';
import '../../../../base/openMap.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/color_data.dart';
import '../../../../base/widget_utils.dart';
import '../../../../bloc/booking/booking_bloc.dart';
import '../../../../bloc/booking/booking_state.dart';
import '../../../details/booking_details.dart';
import '../../booking/modle/booking.dart';
import '../../booking/Widget/statusDropdown.dart';

class BookingListWidget extends StatelessWidget {
  final BuildContext blocContext;
  final DateTime? selectedDate;

  const BookingListWidget({
    super.key,
    required this.blocContext,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
      if (state is BookingLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is BookingError) {
        final message = state.message;
        return Center(
          child: Text(
            'Error: $message',
            style: const TextStyle(color: Colors.red),
          ),
        );
      } else if (state is BookingLoaded) {
        final bookings = state.bookings;
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
                      ? "No bookings for ${DateFormat('dd MMM yyyy').format(selectedDate!)}"
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
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookingDetailsScreen(orderId: booking.id),
                ),
              ),
              child: bookingCard(booking, context),
            );
          },
        );
      }

      return const Center(child: Text('No bookings available.'));
    });
  }

  Widget bookingCard(Booking booking, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
      padding: EdgeInsets.all(FetchPixels.getPixelHeight(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     getCustomFont("Order: ${booking.orderNumber}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
          //     getStatusBadge(booking.orderStatus),
          //   ],
          // ),
          // getCustomFont("Order: ${booking.orderNumber}", 16, Colors.black, 1,
          //     fontWeight: FontWeight.w800),
          // getDivider(dividerColor, 0, 1),
          // getVerSpace(FetchPixels.getPixelHeight(8)),
          // getCustomFont("Customer: ${booking.customerName}", 14, textColor, 1),
          // getCustomFont("Status: ${booking.orderStatus}", 14, textColor, 1),
          // getCustomFont("Payment: ${booking.paymentStatus}", 14, textColor, 1),
          // getCustomFont("Total: AED ${booking.total}", 14, textColor, 1),
          // getCustomFont(
          //     "Created: ${DateFormat('dd MMM yyyy, hh:mm a').format(booking.createdAt)}",
          //     14,
          //     textColor,
          //     1),
          //
          // if (booking.workAssignment.startTime != null)
          //   getCustomFont("Start: ${booking.workAssignment.startTime}", 14,
          //       Colors.black, 1),
          // if (booking.workAssignment.endTime != null)
          //   getCustomFont(
          //       "End: ${booking.workAssignment.endTime}", 14, Colors.black, 1),
          // getDivider(dividerColor, 0, 1), getVerSpace(FetchPixels.getPixelHeight(10)),

          // statusDropdown(blocContext, booking),
          // getCustomFont("Bedrooms: ${booking.bedrooms ?? '-'}", 14, textColor, 1),
          // getCustomFont("Beds: ${booking.beds ?? '-'}", 14, textColor, 1),
          // getCustomFont("Sofa Beds: ${booking.sofaBeds ?? '-'}", 14, textColor, 1),
          // getCustomFont("Pets Present: ${booking.petsPresent == 1 ? 'Yes' : 'No'}", 14, textColor, 1),
          // getCustomFont("With Linen: ${booking.withLinen == 1 ? 'Yes' : 'No'}", 14, textColor, 1),
          // getCustomFont("With Supplies: ${booking.withSupplies == 1 ? 'Yes' : 'No'}", 14, textColor, 1),
          // getCustomFont("Check-In Time: ${booking.checkInTime ?? '-'}", 14, textColor, 1),
          // getCustomFont("Check-Out Time: ${booking.checkOutTime ?? '-'}", 14, textColor, 1),
          // getCustomFont("Occupancy: ${booking.occupancy ?? '-'}", 14, textColor, 1),
          // getCustomFont("Door Access Code: ${booking.doorAccessCode ?? '-'}", 14, textColor, 1),
          // getCustomFont("Booking Date: ${booking.bookingDate ?? '-'}", 14, textColor, 1),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("🔢 Order: ${booking.orderNumber}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
              getStatusBadge(booking.orderStatus),
            ],
          ),
          // getCustomFont("🔢 Order: ${booking.orderNumber}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
          getVerSpace(10),
          getDivider(Colors.grey.shade300, 0, 1),
          getVerSpace(10),
          _infoRow("🧑 Customer", booking.customerName),
          _infoRow("📦 Status", booking.orderStatus.capitalize()),
          _infoRow("💳 Payment", booking.paymentStatus.capitalize()),
          // _infoRow("💰 Total", "AED ${booking.total.toStringAsFixed(2)}"),
          _infoRow("🕐 Created", DateFormat('dd MMM yyyy, hh:mm a').format(booking.createdAt)),
          _infoRow("🕐 Booking Date:","  ${booking.bookingDate ?? '-'}"),

          getDivider(Colors.grey.shade300, 0, 1),
          getVerSpace(FetchPixels.getPixelHeight(10)),
          getDivider(dividerColor, 0, 1),
          getVerSpace(FetchPixels.getPixelHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Order: ${booking.id}", 16, Colors.black, 1, fontWeight: FontWeight.w800),
              statusDropdown(context, booking),
              // <-- Add Dropdown here
            ],
          ),
          // getVerSpace(FetchPixels.getPixelHeight(10)),
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
          getDivider(dividerColor, 0, 1),
          getVerSpace(10),
          _infoRow("🛏️ Bedrooms", "${booking.bedrooms ?? '-'}"),
          _infoRow("🛏️ Beds", "${booking.beds ?? '-'}"),
          _infoRow("🛋️ Sofa Beds", "${booking.sofaBeds ?? '-'}"),
          _infoRow("🐾 Pets Present", booking.petsPresent == 1 ? "Yes" : "No"),
          _infoRow("🧺 Linen Included", booking.withLinen == 1 ? "Yes" : "No"),
          _infoRow("🧼 Supplies Included", booking.withSupplies == 1 ? "Yes" : "No"),
          _infoRow("🚪 Door Code", booking.doorAccessCode ?? "-"),
          _infoRow("📅 Booking Date", booking.bookingDate ?? "-"),
          _infoRow("⏰ Check-In", booking.checkInTime ?? "-"),
          _infoRow("⏳ Check-Out", booking.checkOutTime ?? "-"),
          _infoRow("🏠 Occupancy", booking.occupancy ?? "-"),

          getVerSpace(12),
          getDivider(Colors.grey.shade300, 0, 1),
          getVerSpace(10),
          _infoRow("🛠 Work Status", booking.workAssignment.status.capitalize()),
          if (booking.workAssignment.startTime != null)
            _infoRow("🔛 Start Time", DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.startTime!)),
          if (booking.workAssignment.endTime != null)
            _infoRow("🔚 End Time", DateFormat('dd MMM yyyy, hh:mm a').format(booking.workAssignment.endTime!)),
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
          ),],
      ),
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

}
Widget _infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getCustomFont(label, 14, Colors.grey[700]!, 1),
        getCustomFont(value, 14, Colors.black, 1, fontWeight: FontWeight.w600),
      ],
    ),
  );
}
