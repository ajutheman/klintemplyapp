// class BookingDetail {
//   final int id;
//   final String orderNumber;
//   final double total;
//   final String orderStatus;
//   final String paymentStatus;
//   final String createdAt;
//   final String customerName;
//   final String address;
//   final List<OrderItem> items;
//
//   BookingDetail({
//     required this.id,
//     required this.orderNumber,
//     required this.total,
//     required this.orderStatus,
//     required this.paymentStatus,
//     required this.createdAt,
//     required this.customerName,
//     required this.address,
//     required this.items,
//   });
//
//   factory BookingDetail.fromJson(Map<String, dynamic> json) {
//     final order = json['data']['order'];
//     final address = order['address'];
//     final customer = order['customer'];
//     final items = (order['order_items'] as List)
//         .map((item) => OrderItem.fromJson(item))
//         .toList();
//
//     return BookingDetail(
//       id: order['id'],
//       orderNumber: order['order_number'],
//       total: order['total'].toDouble(),
//       orderStatus: order['order_status'],
//       paymentStatus: order['payment_status'],
//       createdAt: order['created_at'],
//       customerName: customer['name'],
//       address:
//           "${address['flat_number']}, ${address['building_name']}, ${address['street_name']}, ${address['area']}, ${address['emirate']}",
//       items: items,
//     );
//   }
// }
//
// class OrderItem {
//   final String name;
//   final double price;
//   final String image;
//
//   OrderItem({
//     required this.name,
//     required this.price,
//     required this.image,
//   });
//
//   factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
//         name: json['third_category']['name'],
//         price: json['item_total'].toDouble(),
//         image: json['third_category']['image'],
//       );
// }

class BookingDetail {
  final int id;
  final String orderNumber;
  final double total;
  final String orderStatus;
  final String paymentStatus;
  final String paymentMethod;
  final String createdAt;
  final String customerName;
  final String customerEmail;
  final String customerMobile;
  final String address;
  final double subtotal;
  final double taxAmount;
  final double taxRate;
  final double? latitude;
  final double? longitude;
  final List<OrderItem> items;

  BookingDetail({
    required this.id,
    required this.orderNumber,
    required this.total,
    required this.orderStatus,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.createdAt,
    required this.customerName,
    required this.customerEmail,
    required this.customerMobile,
    required this.address,
    required this.subtotal,
    required this.taxAmount,
    required this.taxRate,
    this.latitude,
    this.longitude,
    required this.items,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) {
    final order = json['data']['order'];
    final address = order['address'];
    final customer = order['customer'];
    final items = (order['order_items'] as List)
        .map((item) => OrderItem.fromJson(item))
        .toList();

    return BookingDetail(
      id: order['id'],
      orderNumber: order['order_number'],
      total: (order['total'] as num).toDouble(),
      subtotal: (order['subtotal'] as num).toDouble(),
      taxAmount: (order['tax_amount'] as num).toDouble(),
      taxRate: (order['tax_rate'] as num).toDouble(),
      orderStatus: order['order_status'],
      paymentStatus: order['payment_status'],
      paymentMethod: order['payment_method'],
      createdAt: order['created_at'],
      customerName: customer['name'],
      customerEmail: customer['email'],
      customerMobile: customer['mobile'],
      address:
          "${address['flat_number']}, ${address['building_name']}, ${address['street_name']}, ${address['area']}, ${address['emirate']}",
      latitude: double.tryParse(customer['latitude'] ?? ''),
      longitude: double.tryParse(customer['longitude'] ?? ''),
      items: items,
    );
  }
}

class OrderItem {
  final String name;
  final double price;
  final String image;
  final int employeeCount;

  OrderItem({
    required this.name,
    required this.price,
    required this.image,
    required this.employeeCount,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        name: json['third_category']['name'],
        price: (json['item_total'] as num).toDouble(),
        image: json['third_category']['image'],
        employeeCount: json['employee_count'],
      );
}
