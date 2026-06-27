class LoginResponse {
  final bool success;
  final String message;
  final List<String> fiscalYears;
  final String token;
  final String salesPerson;
  final int isDriver;
  final String defaultCountry;
  final String defaultCurrency;
  final String designation;
  final String department;
  final String mobile;
  final String? image;
  final String homePage;
  final String fullName;

  LoginResponse({
    required this.success,
    required this.message,
    required this.fiscalYears,
    required this.token,
    required this.salesPerson,
    required this.isDriver,
    required this.defaultCountry,
    required this.defaultCurrency,
    required this.designation,
    required this.department,
    required this.mobile,
    required this.image,
    required this.homePage,
    required this.fullName,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final messageData = json['message'];

    return LoginResponse(
      success: messageData['success'],
      message: messageData['message'],
      fiscalYears:
          List<String>.from(messageData['fiscal_years'] ?? []),
      token: messageData['token'] ?? '',
      salesPerson: messageData['sales_person'] ?? '',
      isDriver: messageData['is_driver'] ?? 0,
      defaultCountry: messageData['default_country'] ?? '',
      defaultCurrency: messageData['default_currency'] ?? '',
      designation: messageData['designation'] ?? '',
      department: messageData['department'] ?? '',
      mobile: messageData['mobile'] ?? '',
      image: messageData['image'],
      homePage: json['home_page'] ?? '',
      fullName: json['full_name'] ?? '',
    );
  }
}