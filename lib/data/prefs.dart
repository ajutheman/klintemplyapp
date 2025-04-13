import 'package:shared_preferences/shared_preferences.dart';

import 'model/user_model.dart';
// import '../models/user_model.dart';

class Prefs {
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', user.token);
    await prefs.setInt('employee_id', user.employeeId);
    await prefs.setString('user_name', user.name);
    await prefs.setString('user_email', user.email);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_token');
    // await prefs.remove('user_token');
    await prefs.remove('employee_id');
    await prefs.remove('user_name');
    await prefs.remove('user_email');
  }
}
