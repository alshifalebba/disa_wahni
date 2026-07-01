import 'package:loginpage/core/cloud/cloud.dart';
import 'package:loginpage/domain/get_vehicle/vehicle%20model.dart';
import 'package:loginpage/infrastructure/api_services/api_services.dart';

class VehicleRepository {
  final ApiService api;

  VehicleRepository(this.api);

  static const vehicleUrl =
      "$BASE_URL.v2.generic.get_vehicle_types";

  Future<List<String>> getVehicleTypes() async {
    final response = await api.get(vehicleUrl);

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final data = getVehicleFromJson(response.body);

    if (data.message?.success == false) {
      throw Exception("Failed to load vehicle types");
    }

    return data.message?.message ?? [];
  }
}