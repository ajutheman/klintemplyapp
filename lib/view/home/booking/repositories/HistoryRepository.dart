import '../../../../repository/api_client.dart';
import '../modle/HistoryModel.dart';
// import '../modle/history_assignment_model.dart';

class HistoryRepository {
  final ApiClient apiClient;

  HistoryRepository(this.apiClient);

  Future<List<HistoryAssignment>> fetchHistory({
    required String startDate,
    required String endDate,
  }) async {
    final response = await apiClient.dio.get(
      'employee/works/history',
      queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
      },
    );

    final data = response.data['data']['history'] as List;
    return data.map((e) => HistoryAssignment.fromJson(e)).toList();
  }
}
