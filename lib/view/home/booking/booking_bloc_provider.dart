// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // // import '../bloc/booking/booking_bloc.dart';
// // // import '../bloc/booking/booking_event.dart';
// // // import '../repository/api_client.dart';
// // import '../../../bloc/booking/booking_bloc.dart';
// // import '../../../bloc/booking/booking_event.dart';
// // import '../../../repository/api_client.dart';
// // import '../booking/repositories/booking_repository.dart';
// //
// // class BookingBlocProvider extends StatelessWidget {
// //   final Widget child;
// //
// //   const BookingBlocProvider({Key? key, required this.child}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) {
// //         final apiClient = ApiClient(context);
// //         return BookingBloc(BookingRepository(apiClient))..add(LoadBookings());
// //       },
// //       child: child,
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:kleanitemployeeapp/bloc/booking/booking_bloc.dart';
// import 'package:kleanitemployeeapp/view/home/booking/repositories/booking_repository.dart';
// import 'package:kleanitemployeeapp/repository/api_client.dart';
//
// import '../../../bloc/booking/booking_event.dart';
//
// class BookingBlocProvider extends StatelessWidget {
//   final Widget child;
//
//   const BookingBlocProvider({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final apiClient = ApiClient(context);
//     final repository = BookingRepository(apiClient);
//
//     return BlocProvider(
//       create: (_) => BookingBloc(repository)..add(LoadBookings(date: DateFormat('yyyy-MM-dd').format(DateTime.now()))),
//
//       // ..add(LoadBookings()),
//       child: child,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../bloc/booking/booking_bloc.dart';
import '../../../bloc/booking/booking_event.dart';
import '../../../repository/api_client.dart';
import '../booking/repositories/booking_repository.dart';

class BookingBlocProvider extends StatelessWidget {
  final Widget child;

  const BookingBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(context);
    final repository = BookingRepository(apiClient);
    return BlocProvider(
      create: (_) => BookingBloc(repository)..add(LoadBookings(date: DateFormat('yyyy-MM-dd').format(DateTime.now()))),
      child: child,
    );
  }
}
