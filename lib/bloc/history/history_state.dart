// abstract class HistoryState {}
//
// class HistoryInitial extends HistoryState {}
//
// class HistoryLoading extends HistoryState {}
//
// class HistoryLoaded extends HistoryState {
//   final List<HistoryItem> history;
//
//   HistoryLoaded(this.history);
// }
//
// class HistoryError extends HistoryState {
//   final String error;
//
//   HistoryError(this.error);
// }
//
// class HistoryItem {
//   final int assignmentId;
//   final String workDate;
//   final String formattedDate;
//   final String dayOfWeek;
//   final String workStatus;
//   final String customerName;
//   final String? notes;
//
//   HistoryItem({
//     required this.assignmentId,
//     required this.workDate,
//     required this.formattedDate,
//     required this.dayOfWeek,
//     required this.workStatus,
//     required this.customerName,
//     this.notes,
//   });
//
//   factory HistoryItem.fromJson(Map<String, dynamic> json) {
//     return HistoryItem(
//       assignmentId: json['assignment_id'],
//       workDate: json['work_date'],
//       formattedDate: json['formatted_date'],
//       dayOfWeek: json['day_of_week'],
//       workStatus: json['work_status'],
//       customerName: json['customer_name'],
//       notes: json['notes'],
//     );
//   }
// }
import '../../view/home/booking/modle/HistoryModel.dart';
// import '../modle/history_assignment_model.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<HistoryAssignment> assignments;

  HistoryLoaded(this.assignments);
}

class HistoryError extends HistoryState {
  final String message;

  HistoryError(this.message);
}
