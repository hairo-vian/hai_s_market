import 'package:hai_market/ui/register/api/register_api.dart';
import 'package:hai_market/ui/register/model/register_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class RegisterDataSource {
  final RegisterApi _api;
  final SharedPreferences preference;

  RegisterDataSource(this._api, this.preference);

  Future<void> createUser(String email, String name, String password) {
    return _api.createUser(
      RegisterRequest(
        email: email,
        name: name,
        password: password,
        avatar: "www.randomurl.com",
      ),
    );
  }
}
