// import 'package:flutter_bloc/flutter_bloc.dart';
//
// // import '../../models/subscription_schedule_model.dart';
// // import '../../repository/subscription_schedule_repository.dart';
// import '../../view/home/booking/repositories/subscription_schedule_repository.dart';
// import 'subscription_schedule_event.dart';
// import 'subscription_schedule_state.dart';
//
// class SubscriptionScheduleBloc
//     extends Bloc<SubscriptionScheduleEvent, SubscriptionScheduleState> {
//   final SubscriptionScheduleRepository repository;
//
//   SubscriptionScheduleBloc(this.repository) : super(ScheduleInitial()) {
//     on<LoadAssignments>(_onLoad);
//     on<UpdateAssignmentStatus>(_onUpdateStatus);
//   }
//
//   void _onLoad(LoadAssignments event, Emitter emit) async {
//     emit(ScheduleLoading());
//     try {
//       final assignments = await repository.fetchAssignments();
//       emit(ScheduleLoaded(assignments));
//     } catch (e) {
//       emit(ScheduleError(e.toString()));
//     }
//   }
//
//   void _onUpdateStatus(UpdateAssignmentStatus event, Emitter emit) async {
//     try {
//       await repository.updateStatus(event.assignmentId, event.newStatus);
//       add(LoadAssignments()); // Reload after update
//     } catch (e) {
//       emit(ScheduleError(e.toString()));
//     }
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/home/booking/repositories/subscription_schedule_repository.dart';
import 'subscription_schedule_event.dart';
import 'subscription_schedule_state.dart';

class SubscriptionScheduleBloc
    extends Bloc<SubscriptionScheduleEvent, SubscriptionScheduleState> {
  final SubscriptionScheduleRepository repository;

  SubscriptionScheduleBloc(this.repository) : super(ScheduleInitial()) {
    on<LoadAssignments>(_onLoad);
    on<UpdateAssignmentStatus>(_onUpdateStatus);
  }

  //   Future<void> _onLoad(LoadAssignments event, Emitter emit) async {
  //   emit(ScheduleLoading());
  //   try {
  //     final assignments = await repository.fetchAssignments();
  //     emit(ScheduleLoaded(assignments));
  //   } catch (e) {
  //     emit(ScheduleError(e.toString()));
  //   }
  // }
  Future<void> _onLoad(LoadAssignments event, Emitter emit) async {
    emit(ScheduleLoading());
    try {
      final assignments = await repository.fetchAssignments(date: event.date);
      emit(ScheduleLoaded(assignments));
    } catch (e) {
      emit(ScheduleError(e.toString()));
    }
  }

  Future<void> _onUpdateStatus(
      UpdateAssignmentStatus event, Emitter emit) async {
    try {
      await repository.updateStatus(event.assignmentId, event.newStatus,
          notes: event.notes);
      add(LoadAssignments()); // Reload updated assignments
    } catch (e) {
      emit(ScheduleError(e.toString()));
    }
  }
}
