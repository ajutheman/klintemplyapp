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
    }

    if (state is BookingError) {
      final error = state.message;
      return Center(
        child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
      );
    }

    if (state is BookingLoaded) {
      // ✅ Only rebuild UI if the selectedDate matches state.selectedDate
      final selectedDateFormatted = selectedDate ?? DateFormat('yyyy-MM-dd').format(DateTime.now());
      if (state.selectedDate != selectedDateFormatted) {
        return const Center(child: CircularProgressIndicator()); // Wait for correct state
      }

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
                "No bookings for ${DateFormat('dd MMM yyyy').format(DateTime.parse(selectedDateFormatted))}",
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
    }

    return const Center(child: Text('No bookings available.'));
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
