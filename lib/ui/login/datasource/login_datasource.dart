import 'package:hai_market/contract/pref_contract.dart';
import 'package:hai_market/ui/login/api/login_api.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class LoginDataSource {
  final LoginApi _api;
  final SharedPreferences preference;

  LoginDataSource(this._api, this.preference);

  Future<void> login(String email, String password) async {
    Map<String, String> requestBody = {};
    requestBody["email"] = email;
    requestBody["password"] = password;

    var loginResponse = await _api.login(requestBody);
    var profileResponse = await _api.getProfile("Bearer ${loginResponse.access_token}");

    preference.setString(PrefContract.token, loginResponse.access_token);
    preference.setString(PrefContract.email, profileResponse.email);
    preference.setInt(PrefContract.userId, profileResponse.id);
    preference.setString(PrefContract.name, profileResponse.name);
    var joinedDate = DateTime.parse(profileResponse.creationAt);
    preference.setString(PrefContract.joinedDate, DateFormat('yyyy-MM-dd\nHH:mm:ss').format(joinedDate));
    preference.setBool(PrefContract.isLoggedIn, true);
  }

  String get username => preference.getString(PrefContract.name) ?? "";
}
