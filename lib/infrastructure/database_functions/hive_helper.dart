import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginpage/domain/user_details/user_model.dart';

class HiveHelper {
  static const String boxName = 'userBox';
  static const String userKey = 'userData';

  static Future<Box> openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }
  static Future<void> saveUserData(UserDataModel user) async {
    final box = await openBox();
    await box.put(userKey, user.toJson());
  }
  static Future<UserDataModel?> getUserData() async {
    final box = await openBox();
    final data = box.get(userKey);
    if (data == null) {
      return null;
    }
    return UserDataModel.fromJson(Map<String, dynamic>.from(data));
  }
  static Future<void> clearUserData() async {
    final box = await openBox();
    await box.delete(userKey);
  }
}
