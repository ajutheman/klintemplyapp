// // abstract class SubscriptionScheduleEvent {}
// //
// // class LoadAssignments extends SubscriptionScheduleEvent {}
// //
// // class UpdateAssignmentStatus extends SubscriptionScheduleEvent {
// //   final int assignmentId;
// //   final String newStatus;
// //
// //   UpdateAssignmentStatus(this.assignmentId, this.newStatus);
// // }
//
// abstract class SubscriptionScheduleEvent {}
//
// class LoadAssignments extends SubscriptionScheduleEvent {}
//
// class UpdateAssignmentStatus extends SubscriptionScheduleEvent {
//   final int assignmentId;
//   final String newStatus;
//   final String notes;
//
//   UpdateAssignmentStatus(this.assignmentId, this.newStatus, this.notes);
// }
abstract class SubscriptionScheduleEvent {}

class LoadAssignments extends SubscriptionScheduleEvent {
  final String? date;
  LoadAssignments({this.date});
}

class UpdateAssignmentStatus extends SubscriptionScheduleEvent {
  final int assignmentId;
  final String newStatus;
  final String notes;

  UpdateAssignmentStatus(this.assignmentId, this.newStatus, this.notes);
}
