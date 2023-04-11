import 'package:hai_market/contract/pref_contract.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:hai_market/ui/home/api/home_api.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class HomeDataSource {
  final HomeApi _api;
  final SharedPreferences preference;

  HomeDataSource(this._api, this.preference);

  Future<List<String>> getCategories() => _api.getCategories();

  Future<Products> getLatestReleasedProducts() => _api.getLatestReleasedProduct();

  bool get isLoggedIn => preference.getBool(PrefContract.isLoggedIn) ?? false;
}
