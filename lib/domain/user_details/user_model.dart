import 'package:loginpage/domain/user_details/user_detail_item.dart';

class UserDataModel {
  final String fullName;
  final String designation;
  final String department;
  final String mobile;
  final String salesPerson;
  final String country;
  final String currency;

  UserDataModel({
    required this.fullName,
    required this.designation,
    required this.department,
    required this.mobile,
    required this.salesPerson,
    required this.country,
    required this.currency,
  });

  factory UserDataModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserDataModel(
      fullName: json['fullName'] ?? '',
      designation: json['designation'] ?? '',
      department: json['department'] ?? '',
      mobile: json['mobile'] ?? '',
      salesPerson: json['salesPerson'] ?? '',
      country: json['country'] ?? '',
      currency: json['currency'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'designation': designation,
      'department': department,
      'mobile': mobile,
      'salesPerson': salesPerson,
      'country': country,
      'currency': currency,
    };
  }

  List<UserDetailItem> get details => [
        UserDetailItem(
          title: "Full Name",
          value: fullName,
        ),
        UserDetailItem(
          title: "Designation",
          value: designation,
        ),
        UserDetailItem(
          title: "Department",
          value: department,
        ),
        UserDetailItem(
          title: "Mobile Number",
          value: mobile,
        ),
        UserDetailItem(
          title: "Sales Person",
          value: salesPerson,
        ),
        UserDetailItem(
          title: "Country",
          value: country,
        ),
        UserDetailItem(
          title: "Currency",
          value: currency,
        ),
      ];
}