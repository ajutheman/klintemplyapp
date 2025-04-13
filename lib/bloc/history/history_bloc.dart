import 'package:flutter_bloc/flutter_bloc.dart';

// import '../repositories/history_repository.dart';
import '../../view/home/booking/repositories/HistoryRepository.dart';
import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository repository;

  HistoryBloc(this.repository) : super(HistoryInitial()) {
    on<LoadHistory>((event, emit) async {
      emit(HistoryLoading());
      try {
        final assignments = await repository.fetchHistory(
          startDate: event.startDate,
          endDate: event.endDate,
        );
        emit(HistoryLoaded(assignments));
      } catch (e) {
        emit(HistoryError(e.toString()));
      }
    });
  }
}
