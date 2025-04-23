import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kleanitemployeeapp/view/home/tab/tab_booking.dart';

// import 'package:kleanitemployee/view/home/tab/tab_booking.dart';

import '../../../../bloc/booking/booking_bloc.dart';
import '../../../../bloc/booking/booking_event.dart';
import '../modle/booking.dart';

// Widget statusDropdown(BuildContext blocContext, Booking booking) {
//   const statuses = [
//     'pending',
//     'accepted',
//     'rejected',
//     'travelling',
//     'started',
//     'completed'
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
//         child: Text(status.capitalize(), style: const TextStyle(fontSize: 14)),
//       );
//     }).toList(),
//     onChanged: (String? newValue) {
//       if (newValue != null && newValue != booking.orderStatus) {
//         BlocProvider.of<BookingBloc>(blocContext).add(
//           UpdateBookingStatus(booking.id, newValue),
//         );
//       }
//     },
//   );
// }

Widget statusDropdown(BuildContext blocContext, Booking booking) {
  const statuses = [
    'pending',
    'accepted',
    'rejected',
    'travelling',
    'started',
    'completed',
    'confirmed',
  ];

  final currentStatus =
      booking.workAssignment.status; // ⬅️ Use assignment status

  return DropdownButton<String>(
    value: statuses.contains(currentStatus) ? currentStatus : null,
    underline: const SizedBox(),
    borderRadius: BorderRadius.circular(8),
    icon: const Icon(Icons.keyboard_arrow_down),
    items: statuses.map((String status) {
      return DropdownMenuItem<String>(
        value: status,
        child: Text(status.capitalize(), style: const TextStyle(fontSize: 14)),
      );
    }).toList(),
    onChanged: (String? newValue) {
      if (newValue != null && newValue != currentStatus) {
        BlocProvider.of<BookingBloc>(blocContext).add(
          UpdateBookingStatus(booking.id, newValue),
        );
      }
    },
  );
}
