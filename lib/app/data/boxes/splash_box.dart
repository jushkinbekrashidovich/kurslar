import 'package:hive/hive.dart';

const String splashBoxName = 'splashBox';

class SplashBox {
  static const String seenSplashKey = 'seenSplash';

  static Box get box => Hive.box(splashBoxName);

  static Future<void> markSeenSplash() async {
    await box.put(seenSplashKey, true);
  }

  static bool get hasSeenSplash => box.get(seenSplashKey, defaultValue: false);
}
