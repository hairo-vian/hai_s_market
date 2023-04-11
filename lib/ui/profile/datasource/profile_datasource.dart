import 'package:hai_market/contract/pref_contract.dart';
import 'package:hai_market/ui/profile/api/profile_api.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileDataSource {
  final ProfileApi _api;
  final SharedPreferences preference;

  ProfileDataSource(this._api, this.preference);

  String get name => preference.getString(PrefContract.name) ?? "";

  String get email => preference.getString(PrefContract.email) ?? "";

  String get joinedDate => preference.getString(PrefContract.joinedDate) ?? "";
}
