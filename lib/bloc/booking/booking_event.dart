abstract class BookingEvent {}

// class LoadBookings extends BookingEvent {}
class LoadBookings extends BookingEvent {
  final String? date;
  LoadBookings({this.date});
}

class UpdateBookingStatus extends BookingEvent {
  final int orderId;
  final String status;

  UpdateBookingStatus(this.orderId, this.status);
}
