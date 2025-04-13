class HistoryAssignment {
  final int assignmentId;
  final String workDate;
  final String formattedDate;
  final String dayOfWeek;
  final String workStatus;
  final String customerName;
  final String time;
  final String? notes;

  HistoryAssignment({
    required this.assignmentId,
    required this.workDate,
    required this.formattedDate,
    required this.dayOfWeek,
    required this.workStatus,
    required this.customerName,
    required this.time,
    this.notes,
  });

  factory HistoryAssignment.fromJson(Map<String, dynamic> json) {
    return HistoryAssignment(
      assignmentId: json['assignment_id'],
      workDate: json['work_date'],
      formattedDate: json['formatted_date'],
      dayOfWeek: json['day_of_week'],
      workStatus: json['work_status'],
      customerName: json['customer_name'],
      time: json['time'],
      notes: json['notes'],
    );
  }
}
