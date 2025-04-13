// class UserModel {
//   final bool status;
//   final String token;
//   final int employeeId;
//   final String name;
//   final String email;
//
//   UserModel({
//     required this.status,
//     required this.token,
//     required this.employeeId,
//     required this.name,
//     required this.email,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       status: json["status"],
//       token: json["token"],
//       employeeId: json["employee_id"],
//       name: json["name"],
//       email: json["email"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "token": token,
//         "employee_id": employeeId,
//         "name": name,
//         "email": email,
//       };
// }
class UserModel {
  final bool status;
  final String token;
  final int employeeId;
  final String name;
  final String email;

  UserModel({
    required this.status,
    required this.token,
    required this.employeeId,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json["status"] is bool ? json["status"] : true,
      token: json["token"] ?? "",
      employeeId: json["employee_id"] ?? json["id"],
      name: json["name"] ?? "",
      email: json["email"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "employee_id": employeeId,
        "name": name,
        "email": email,
      };
}
