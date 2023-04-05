import 'package:shared_preferences/shared_preferences.dart';

class PreferenceFactory {
  late SharedPreferences preferences;

  SharedPreferences create() {

    return preferences;
  }
}

class SPContract {
  static const String SAMPLE = "sample";
}
