// import 'package:flutter_bloc/flutter_bloc.dart';
//
// // import '../../view/home/booking/modle/repositories/booking_repository.dart';
// import '../../view/home/booking/repositories/booking_repository.dart';
// import 'booking_event.dart';
// import 'booking_state.dart';
// // import '../../repositories/booking_repository.dart';
//
// class BookingBloc extends Bloc<BookingEvent, BookingState> {
//   final BookingRepository repository;
//
//   BookingBloc(this.repository) : super(BookingLoading()) {
//     on<LoadBookings>((event, emit) async {
//       emit(BookingLoading());
//       try {
//         final bookings = await repository.fetchBookings();
//         emit(BookingLoaded(bookings));
//       } catch (e) {
//         emit(BookingError(e.toString()));
//       }
//     });
//   }
// }
// booking_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/home/booking/repositories/booking_repository.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository repository;

  BookingBloc(this.repository) : super(BookingLoading()) {
    on<LoadBookings>(_onLoadBookings);
    on<UpdateBookingStatus>(_onUpdateBookingStatus);
  }

  Future<void> _onLoadBookings(
    LoadBookings event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());
    try {
      final bookings = await repository.fetchBookings();
      emit(BookingLoaded(bookings));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  Future<void> _onUpdateBookingStatus(
    UpdateBookingStatus event,
    Emitter<BookingState> emit,
  ) async {
    try {
      print('🔁 Updated order $event.orderId to status: ${event.status}');

      await repository.updateOrderStatus(event.orderId, event.status);
      add(LoadBookings()); // Refresh bookings after update
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }
}
