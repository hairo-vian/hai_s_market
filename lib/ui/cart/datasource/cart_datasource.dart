
import 'package:hai_market/ui/cart/api/cart_api.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CartDataSource {
  final CartApi _api;
  final SharedPreferences preference;

  CartDataSource(this._api, this.preference);

}
