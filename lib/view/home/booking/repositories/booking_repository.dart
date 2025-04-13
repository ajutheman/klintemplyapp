// import '../data/api_client.dart';
// import '../models/booking.dart';

// import 'package:kleanitemployee/view/home/booking/modle%20/booking.dart';

import '../../../../../repository/api_client.dart';
import '../modle/booking.dart';
import '../modle/booking_detail.dart';

class BookingRepository {
  final ApiClient apiClient;

  BookingRepository(this.apiClient);

  Future<List<Booking>> fetchBookings() async {
    final response = await apiClient.dio.get('employee/orders');
    final orders = response.data['data']['orders'] as List;
    return orders.map((order) => Booking.fromJson(order)).toList();
  }

  Future<BookingDetail> fetchBookingDetail(int orderId) async {
    final response = await apiClient.dio.get('employee/orders/$orderId');
    return BookingDetail.fromJson(response.data);
  }

  // Future<void> updateOrderStatus(int orderId, String status) async {
  //   await apiClient.dio.get(
  //     'employee/orders/$orderId',
  //     data: {'work_status': status},
  //   );
  //   // );await apiClient.dio.put(
  //   //   'employee/orders/$orderId',
  //   //   data: {'work_status': status},
  //   // );
  // }
  Future<void> updateOrderStatus(int orderId, String status) async {
    await apiClient.dio.put(
      'employee/orders/$orderId',
      data: {'work_status': status},
    );
  }
}
