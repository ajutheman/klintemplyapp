// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// // import '../utils/prefs.dart';
// import '../data/prefs.dart';
// import '../routes/app_routes.dart';
//
// class ApiClient {
//   late Dio dio;
//
//   ApiClient(BuildContext context) {
//     dio = Dio(BaseOptions(
//       baseUrl: "https://kleanit.planetprouae.com/api/",
//     ));
//
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         final token = await Prefs.getToken();
//         if (token != null) {
//           options.headers['Authorization'] = 'Bearer $token';
//         }
//         handler.next(options);
//       },
//       onError: (DioException e, handler) {
//         if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
//           _handleUnauthorized(context);
//         }
//         handler.next(e);
//       },
//     ));
//   }
//
//   void _handleUnauthorized(BuildContext context) async {
//     await Prefs.clearToken();
//     if (context.mounted) {
//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         Routes.loginRoute,
//         (route) => false,
//       );
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/prefs.dart';
import '../routes/app_routes.dart';

class ApiClient {
  late Dio dio;

  ApiClient(BuildContext context) {
    dio = Dio(BaseOptions(
      baseUrl: "https://backend.kleanit.ae/api/",
      // baseUrl: "https://kleanit.planetprouae.com/api/",
    ));

    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await Prefs.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          // ✅ Log request data
          print("📤 REQUEST → ${options.method} ${options.uri}");
          print("🔐 Headers: ${options.headers}");
          print("📝 Body: ${options.data}");

          handler.next(options);
        },
        onResponse: (response, handler) {
          // ✅ Log response
          print(
              "✅ RESPONSE ← ${response.statusCode} ${response.requestOptions.uri}");
          print("📦 Data: ${response.data}");

          handler.next(response);
        },
        onError: (DioException e, handler) {
          // ❌ Log error
          print("❌ ERROR ⛔ ${e.response?.statusCode} ${e.requestOptions.uri}");
          print("💥 Message: ${e.message}");
          print("📦 Response: ${e.response?.data}");

          if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
            _handleUnauthorized(context);
          }
          handler.next(e);
        },
      ),
    ]);
  }

  void _handleUnauthorized(BuildContext context) async {
    await Prefs.clearToken();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.loginRoute,
        (route) => false,
      );
    }
  }
}
