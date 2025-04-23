// // // import '../../models/booking.dart';
// // import '../../view/home/booking/modle/booking.dart';
// //
// // abstract class BookingState {}
// //
// // class BookingLoading extends BookingState {}
// //
// // class BookingLoaded extends BookingState {
// //   final List<Booking> bookings;
// //   BookingLoaded(this.bookings);
// // }
// //
// // class BookingError extends BookingState {
// //   final String message;
// //   BookingError(this.message);
// // }
// // import 'package:equatable/equatable.dart';
//
// import 'package:equatable/equatable.dart';
//
// import '../../view/home/booking/modle/booking.dart';
//
// abstract class BookingState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class BookingLoading extends BookingState {}
//
// class BookingLoaded extends BookingState {
//   final List<Booking> bookings;
//
//   BookingLoaded(this.bookings);
//
//   @override
//   List<Object?> get props => [bookings];
// }
//
// class BookingError extends BookingState {
//   final String message;
//
//   BookingError(this.message);
//
//   @override
//   List<Object?> get props => [message];
// }
// booking_state.dart
//
// import 'package:equatable/equatable.dart';
// import '../../view/home/booking/modle/booking.dart';
//
// abstract class BookingState extends Equatable {
//   const BookingState();
//   @override
//   List<Object?> get props => [];
// }
//
// class BookingLoading extends BookingState {}
//
// class BookingLoaded extends BookingState {
//   final List<Booking> bookings;
//   final String? selectedDate;
//
//   const BookingLoaded(this.bookings, {this.selectedDate});
//
//   @override
//   List<Object?> get props => [bookings, selectedDate];
// }
//
// class BookingError extends BookingState {
//   final String message;
//
//   const BookingError(this.message);
//
//   @override
//   List<Object?> get props => [message];
// }




import 'package:equatable/equatable.dart';
import '../../view/home/booking/modle/booking.dart';

abstract class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object?> get props => [];
}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<Booking> bookings;
  final String? selectedDate;

  const BookingLoaded(this.bookings, {this.selectedDate});

  @override
  List<Object?> get props => [bookings, selectedDate];
}

class BookingError extends BookingState {
  final String message;

  const BookingError(this.message);

  @override
  List<Object?> get props => [message];
}
