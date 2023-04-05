
import 'package:hai_market/ui/product_detail/api/product_detail_api.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProductDetailDataSource {
  final ProductDetailApi _api;
  final SharedPreferences preference;

  ProductDetailDataSource(this._api, this.preference);

}
