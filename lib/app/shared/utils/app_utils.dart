import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mps/app/domain/entity/user/user_entity.dart';

class AppUtils {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserEntityAdapter());
    await Hive.openBox("users");
  }
}
