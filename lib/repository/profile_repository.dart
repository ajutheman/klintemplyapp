// import 'package:dio/dio.dart';
//
// import '../data/model/employee_model.dart';
// // import '../models/employee_model.dart';
//
// class ProfileRepository {
//   final Dio _dio = Dio();
//
//   Future<EmployeeModel> getProfile(String token) async {
//     final response = await _dio.get(
//       'https://kleanit.planetprouae.com/api/employee/profile/get-profile',
//       options: Options(headers: {'Authorization': 'Bearer $token'}),
//     );
//
//     if (response.statusCode == 200) {
//       return EmployeeModel.fromJson(response.data["employee"]);
//     } else {
//       throw Exception('Failed to load profile');
//     }
//   }
// }
// import '../models/employee_model.dart';
// import '../network/api_client.dart';

// import 'package:flutter/material.dart';
//
// import '../data/model/employee_model.dart';
// import 'api_client.dart';
//
// class ProfileRepository {
//   late ApiClient _apiClient;
//
//   ProfileRepository(BuildContext context) {
//     _apiClient = ApiClient(context);
//   }
//
//   Future<EmployeeModel> getProfile() async {
//     final response = await _apiClient.dio.get('employee/profile/get-profile');
//
//     if (response.statusCode == 200) {
//       return EmployeeModel.fromJson(response.data["employee"]);
//     } else {
//       throw Exception('Failed to load profile');
//     }
//   }
// }
import 'package:flutter/material.dart';

import '../data/model/employee_model.dart';
import 'api_client.dart';

class ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepository(BuildContext context) : _apiClient = ApiClient(context);

  Future<EmployeeModel> getProfile() async {
    try {
      final response = await _apiClient.dio.get('employee/profile/get-profile');

      if (response.statusCode == 200 && response.data["employee"] != null) {
        return EmployeeModel.fromJson(response.data["employee"]);
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Error fetching profile: $e');
    }
  }
}
