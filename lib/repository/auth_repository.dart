// import 'package:dio/dio.dart';
//
// import '../data/model/user_model.dart';
//
// // import '../models/user_model.dart';
//
// class AuthRepository {
//   final Dio _dio = Dio();
//
//   Future<UserModel> login(String email, String password) async {
//     final response = await _dio.post(
//       'https://kleanit.planetprouae.com/api/employee/login',
//       data: FormData.fromMap({
//         'email': email,
//         'password': password,
//       }),
//     );
//
//     if (response.statusCode == 200 && response.data['status'] == true) {
//       return UserModel.fromJson(response.data);
//     } else {
//       throw Exception(response.data['message'] ?? 'Login failed');
//     }
//   }
// }

// class AuthRepository {
//   final ApiClient apiClient;
//
//   AuthRepository(BuildContext context) : apiClient = ApiClient(context);
//
//   Future<UserModel> login(String email, String password) async {
//     try {
//       final response = await apiClient.dio.post(
//         'employee/login',
//         data: FormData.fromMap({
//           'email': email,
//           'password': password,
//         }),
//       );
//
//       if (response.statusCode == 200 && response.data['status'] == true) {
//         return UserModel.fromJson(response.data);
//       } else {
//         throw Exception(response.data['message'] ?? 'Login failed');
//       }
//     } on DioException catch (e) {
//       throw Exception(e.response?.data['message'] ?? e.message);
//     }
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import '../data/model/user_model.dart';
// import '../repository/api_client.dart';
//
// // class AuthRepository {
// //   final ApiClient apiClient;
// //
// //   AuthRepository(BuildContext context) : apiClient = ApiClient(context);
// //
// //   Future<UserModel> login(
// //       String email, String password, String fcmToken) async {
// //     try {
// //       final response = await apiClient.dio.post(
// //         'employee/login',
// //         data: FormData.fromMap({
// //           'email': email,
// //           'password': password,
// //         }),
// //       );
// //
// //       if (response.statusCode == 200 && response.data['status'] == true) {
// //         UserModel user = UserModel.fromJson(response.data);
// //
// //         // 🔥 Send FCM token after login
// //         final fcmResponse = await apiClient.dio.post(
// //           'employee/employee-notification/fcm/register-token',
// //           data: {"fcm_token": fcmToken},
// //         );
// //
// //         if (fcmResponse.statusCode == 200 &&
// //             fcmResponse.data["employee"] != null) {
// //           // Get updated employee info from response
// //           user = UserModel.fromJson({
// //             "data": {"user": fcmResponse.data["employee"]}
// //           });
// //         }
// //
// //         return user;
// //       } else {
// //         throw Exception(response.data['message'] ?? 'Login failed');
// //       }
// //     } on DioException catch (e) {
// //       throw Exception(e.response?.data['message'] ?? e.message);
// //     }
// //   }
// //
// //   Future<UserModel> registerFcmToken(String token) async {
// //     final response = await apiClient.dio.post(
// //       'employee/employee-notification/fcm/register-token',
// //       data: {"fcm_token": token},
// //     );
// //
// //     if (response.statusCode == 200) {
// //       return UserModel.fromJson({
// //         'data': {'user': response.data['employee']}
// //       });
// //     } else {
// //       throw Exception("Failed to register FCM token");
// //     }
// //   }
// // }
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import '../data/model/user_model.dart';
// import '../repository/api_client.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/user_model.dart';
import 'api_client.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(BuildContext context) : apiClient = ApiClient(context);

  Future<UserModel> login(
      String email, String password, String fcmToken) async {
    try {
      final loginResponse = await apiClient.dio.post(
        'employee/login',
        data: FormData.fromMap({
          'email': email,
          'password': password,
        }),
      );
      print("🔐 LOGIN RESPONSE: ${loginResponse.data}");

      if (loginResponse.statusCode == 200 &&
          loginResponse.data['status'] == true) {
        // Parse login response
        UserModel user = UserModel.fromJson(loginResponse.data);

        // ⚠️ Create a separate Dio instance with token manually set
        Dio fcmDio = Dio(BaseOptions(
          baseUrl: "https://kleanit.planetprouae.com/api/",
          headers: {
            'Authorization': 'Bearer ${user.token}',
            'Content-Type': 'application/json',
          },
        ));

        final fcmResponse = await fcmDio.post(
          'employee/employee-notification/fcm/register-token',
          data: {
            "fcm_token": fcmToken,
          },
        );
        print("📲 FCM RESPONSE: ${fcmResponse.data}");

        if (fcmResponse.statusCode == 200 &&
            fcmResponse.data['employee'] != null) {
          final emp = fcmResponse.data['employee'];
          user = UserModel(
            status: true,
            token: user.token,
            employeeId: emp['id'],
            name: emp['name'],
            email: emp['email'],
          );
        }

        return user;
      } else {
        throw Exception(loginResponse.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      print("❌ LOGIN ERROR: ${e.response?.data}");

      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }
}
