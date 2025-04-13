class EmployeeModel {
  final int id;
  final String name;
  final String email;
  final String phone1;
  final String image;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone1,
    required this.image,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone1: json["phone1"],
      image: json["image"],
    );
  }
}
