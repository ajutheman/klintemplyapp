// class EmployeeModel {
//   final int id;
//   final String name;
//   final String email;
//   final String phone1;
//   final String image;
//
//   EmployeeModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone1,
//     required this.image,
//   });
//
//   factory EmployeeModel.fromJson(Map<String, dynamic> json) {
//     return EmployeeModel(
//       id: json["id"],
//       name: json["name"],
//       email: json["email"],
//       phone1: json["phone1"],
//       image: json["image"],
//     );
//   }
// }
class EmployeeModel {
  final int id;
  final String name;
  final String email;
  final String phone1;
  final String? phone2;
  final String image;
  final String? fcmToken;
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final String? buildingName;
  final String? houseNumber;
  final String? apartmentNumber;
  final String? passportNumber;
  final String? passportExpiryDate;
  final String? visaNumber;
  final String? visaExpiryDate;
  final String? emiratesId;
  final String? emiratesIdExpiryDate;
  final String? contractType;
  final String? contractValidity;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone1,
    required this.image,
    this.phone2,
    this.fcmToken,
    this.street,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.buildingName,
    this.houseNumber,
    this.apartmentNumber,
    this.passportNumber,
    this.passportExpiryDate,
    this.visaNumber,
    this.visaExpiryDate,
    this.emiratesId,
    this.emiratesIdExpiryDate,
    this.contractType,
    this.contractValidity,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json["id"],
      name: json["name"] ?? '',
      email: json["email"] ?? '',
      phone1: json["phone1"] ?? '',
      image: json["image"] ?? '',
      phone2: json["phone2"],
      fcmToken: json["fcm_token"],
      street: json["street"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      postalCode: json["postal_code"],
      buildingName: json["building_name"],
      houseNumber: json["house_number"],
      apartmentNumber: json["apartment_number"],
      passportNumber: json["passport_number"],
      passportExpiryDate: json["passport_expiry_date"],
      visaNumber: json["visa_number"],
      visaExpiryDate: json["visa_expiry_date"],
      emiratesId: json["emirates_id"],
      emiratesIdExpiryDate: json["emirates_id_expiry_date"],
      contractType: json["contract_type"],
      contractValidity: json["contract_validity"],
    );
  }
}
