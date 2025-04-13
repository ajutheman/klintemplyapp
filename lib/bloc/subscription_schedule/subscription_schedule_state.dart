// import '../../models/subscription_schedule_model.dart';

import '../../view/home/booking/modle/subscription_schedule_model.dart';

abstract class SubscriptionScheduleState {}

class ScheduleInitial extends SubscriptionScheduleState {}

class ScheduleLoading extends SubscriptionScheduleState {}

class ScheduleLoaded extends SubscriptionScheduleState {
  final List<SubscriptionAssignment> assignments;

  ScheduleLoaded(this.assignments);
}

class ScheduleError extends SubscriptionScheduleState {
  final String error;

  ScheduleError(this.error);
}
