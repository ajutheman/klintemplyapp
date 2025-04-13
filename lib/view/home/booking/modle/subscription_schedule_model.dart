class SubscriptionAssignment {
  final int assignmentId;
  final String workDate;
  final String dayOfWeek;
  final String workStatus;
  final String? notes;
  final Customer customer;
  final Order order;
  final Category category;
  final String time;
  final int scheduleId;

  SubscriptionAssignment({
    required this.assignmentId,
    required this.workDate,
    required this.dayOfWeek,
    required this.workStatus,
    this.notes,
    required this.customer,
    required this.order,
    required this.category,
    required this.time,
    required this.scheduleId,
  });

  factory SubscriptionAssignment.fromJson(Map<String, dynamic> json) {
    return SubscriptionAssignment(
      assignmentId: json['assignment_id'],
      workDate: json['work_date'],
      dayOfWeek: json['day_of_week'],
      workStatus: json['work_status'],
      notes: json['notes'],
      customer: Customer.fromJson(json['customer']),
      order: Order.fromJson(json['order']),
      category: Category.fromJson(json['category']),
      time: json['time'],
      scheduleId: json['schedule_id'],
    );
  }
}

class Customer {
  final String name;
  final String phone;
  final String address;

  Customer({required this.name, required this.phone, required this.address});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}

class Order {
  final int id;
  final double total;
  final int employeeCount;

  Order({required this.id, required this.total, required this.employeeCount});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      total: double.tryParse(json['total'].toString()) ?? 0,
      employeeCount: json['employee_count'],
    );
  }
}

class Category {
  final String name;
  final String description;

  Category({required this.name, required this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      description: json['description'],
    );
  }
}
