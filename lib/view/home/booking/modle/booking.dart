class Booking {
  final int id;
  final String orderNumber;
  final double total;
  final String orderStatus;
  final String paymentStatus;
  final DateTime createdAt;
  final String customerName;
  final String workAssignmentStatus;

  final int orderItemsCount;

  Booking({
    required this.id,
    required this.orderNumber,
    required this.total,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.customerName,
    required this.workAssignmentStatus,
    required this.orderItemsCount,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json['id'],
        orderNumber: json['order_number'],
        total: json['total'].toDouble(),
        orderStatus: json['order_status'],
        paymentStatus: json['payment_status'],
        createdAt: DateTime.parse(json['created_at']),
        customerName: json['customer_name'],
        workAssignmentStatus: json['work_assignment_status'],
        orderItemsCount: json['order_items_count'],
      );
}
