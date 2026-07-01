import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginpage/domain/checkin/checkin_hive_model.dart';

class CheckinHiveHelper {
  static const String boxName = "checkinBox";
  static const String key = "checkinData";

  static Future<Box> openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }

    return Hive.box(boxName);
  }

  static Future<void> save(CheckinHiveModel model) async {
    final box = await openBox();
    await box.put(key, model.toJson());
  }

  static Future<CheckinHiveModel?> get() async {
    final box = await openBox();

    final data = box.get(key);

    if (data == null) return null;

    return CheckinHiveModel.fromJson(
      Map<String, dynamic>.from(data),
    );
  }

  static Future<void> clear() async {
    final box = await openBox();
    await box.delete(key);
  }

  /// SAVE CHECK-IN
  static Future<void> saveCheckIn({
    required String vehicleType,
    required String odometerValue,
    String? odometerImage,
  }) async {
    final model = CheckinHiveModel(
      vehicleType: vehicleType,
      odometerValue: odometerValue,
      odometerImage: odometerImage,
      checkInTime: DateTime.now().toIso8601String(),
      checkOutTime: null,
      isCheckedIn: true,
    );

    final box = await openBox();
    await box.put(key, model.toJson());
  }

  /// UPDATE CHECK-OUT
  static Future<void> updateCheckOut() async {
    final data = await get();

    if (data == null) return;

    final updated = data.copyWith(
      checkOutTime: DateTime.now().toIso8601String(),
      isCheckedIn: false,
    );

    final box = await openBox();
    await box.put(key, updated.toJson());
  }

  static Future<bool> isAttendanceCompletedToday() async {
  final data = await get();

  if (data == null) {
    return false;
  }

  return data.completedToday;
}
}