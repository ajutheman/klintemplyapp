abstract class HistoryEvent {}

class LoadHistory extends HistoryEvent {
  final String startDate;
  final String endDate;

  LoadHistory({required this.startDate, required this.endDate});
}
