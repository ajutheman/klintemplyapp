abstract class BookingEvent {}

class LoadBookings extends BookingEvent {}

class UpdateBookingStatus extends BookingEvent {
  final int orderId;
  final String status;

  UpdateBookingStatus(this.orderId, this.status);
}
