// import '../../../../repository/api_client.dart';
// import '../modle/subscription_schedule_model.dart';
//
// class SubscriptionScheduleRepository {
//   final ApiClient apiClient;
//
//   SubscriptionScheduleRepository(this.apiClient);
//
//   Future<List<SubscriptionAssignment>> fetchAssignments() async {
//     final response = await apiClient.dio.get('employee/works');
//     final data = response.data['data']['assignments'] as List;
//     return data.map((e) => SubscriptionAssignment.fromJson(e)).toList();
//   }
//
//   Future<void> updateStatus(int assignmentId, String newStatus,
//       {String notes = "Started the work"}) async {
//     await apiClient.dio.put(
//       'employee/works/status/$assignmentId',
//       data: {
//         "status": newStatus,
//         "notes": notes,
//       },
//     );
//   }
// }

import '../../../../repository/api_client.dart';
import '../modle/subscription_schedule_model.dart';

class SubscriptionScheduleRepository {
  final ApiClient apiClient;

  SubscriptionScheduleRepository(this.apiClient);

  // Future<List<SubscriptionAssignment>> fetchAssignments() async {
  //   final response = await apiClient.dio.get('employee/works');
  //   final data = response.data['data']['assignments'] as List;
  //   return data.map((e) => SubscriptionAssignment.fromJson(e)).toList();
  // }
  Future<List<SubscriptionAssignment>> fetchAssignments({String? date}) async {
    final url = date != null
        ? 'employee/works?date=$date'
        : 'employee/works';
    final response = await apiClient.dio.get(url);
    final data = response.data['data']['assignments'] as List;
    return data.map((e) => SubscriptionAssignment.fromJson(e)).toList();
  }

  Future<void> updateStatus(int assignmentId, String newStatus,
      {String notes = "Started the work"}) async {
    await apiClient.dio.put(
      'employee/works/status/$assignmentId',
      data: {
        "status": newStatus,
        "notes": notes,
      },
    );
  }
}
