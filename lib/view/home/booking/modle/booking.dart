// class Booking {
//   final int id;
//   final String orderNumber;
//   final double total;
//   final String orderStatus;
//   final String paymentStatus;
//   final DateTime createdAt;
//   final String customerName;
//   final String workAssignmentStatus;
//
//   final int orderItemsCount;
//
//   Booking({
//     required this.id,
//     required this.orderNumber,
//     required this.total,
//     required this.orderStatus,
//     required this.paymentStatus,
//     required this.createdAt,
//     required this.customerName,
//     required this.workAssignmentStatus,
//     required this.orderItemsCount,
//   });
//
//   factory Booking.fromJson(Map<String, dynamic> json) => Booking(
//         id: json['id'],
//         orderNumber: json['order_number'],
//         total: json['total'].toDouble(),
//         orderStatus: json['order_status'],
//         paymentStatus: json['payment_status'],
//         createdAt: DateTime.parse(json['created_at']),
//         customerName: json['customer_name'],
//         workAssignmentStatus: json['work_assignment_status'],
//         orderItemsCount: json['order_items_count'],
//       );
// }

class Booking {
  final int id;
  final String orderNumber;
  final double total;
  final String orderStatus;
  final String paymentStatus;
  final DateTime createdAt;
  final String customerName;
  final WorkAssignment workAssignment;
  final int orderItemsCount;
  // Optional fields
  final int? bedrooms;
  final int? beds;
  final int? sofaBeds;
  final int? petsPresent;
  final int? withLinen;
  final int? withSupplies;
  final String? checkInTime;
  final String? checkOutTime;
  final String? occupancy;
  final String? doorAccessCode;
  final String? bookingDate;

  Booking({
    required this.id,
    required this.orderNumber,
    required this.total,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.customerName,
    required this.workAssignment,
    required this.orderItemsCount,
    this.bedrooms,
    this.beds,
    this.sofaBeds,
    this.petsPresent,
    this.withLinen,
    this.withSupplies,
    this.checkInTime,
    this.checkOutTime,
    this.occupancy,
    this.doorAccessCode,
    this.bookingDate,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json['id'] ?? 0,
        orderNumber: json['order_number'] ?? '',
        total: (json['total'] ?? 0).toDouble(),
        orderStatus: json['order_status'] ?? '',
        paymentStatus: json['payment_status'] ?? '',
        createdAt:
            DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
        customerName: json['customer_name'] ?? '',
        workAssignment: WorkAssignment.fromJson(json['work_assignment'] ?? {}),
        orderItemsCount: json['order_items_count'] ?? 0,
    // Optional fields
    bedrooms: json['bedrooms'],
    beds: json['beds'],
    sofaBeds: json['sofa_beds'],
    petsPresent: json['pets_present'],
    withLinen: json['with_linen'],
    withSupplies: json['with_supplies'],
    // checkInTime: json['check_in_time'],
    // checkOutTime: json['check_out_time'],
    // occupancy: json['occupancy'],
    // doorAccessCode: json['door_access_code'],
    // bookingDate: json['booking_date'],
    checkInTime: json['check_in_time']?.toString(),
    checkOutTime: json['check_out_time']?.toString(),
    occupancy: json['occupancy']?.toString(),
    doorAccessCode: json['door_access_code']?.toString(),
    bookingDate: json['booking_date']?.toString(),
      );
}

class WorkAssignment {
  final String status;
  final DateTime? startTime;
  final DateTime? endTime;

  WorkAssignment({
    required this.status,
    this.startTime,
    this.endTime,
  });

  factory WorkAssignment.fromJson(Map<String, dynamic> json) {
    return WorkAssignment(
      status: json['status'] ?? '',
      startTime: json['start_time'] != null
          ? DateTime.tryParse(json['start_time'])
          : null,
      endTime:
          json['end_time'] != null ? DateTime.tryParse(json['end_time']) : null,
    );
  }
}
