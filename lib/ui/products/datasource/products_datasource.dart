import 'package:hai_market/model/product/product.dart';
import 'package:hai_market/ui/products/api/products_api.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProductsDataSource {
  final ProductsApi _api;
  final SharedPreferences preference;

  ProductsDataSource(this._api, this.preference);

  Future<Products> getProducts(String? categoryName, String? searchKeyword, int skipLength, int limit) =>
      categoryName.isNull
          ? _api.getAllProducts(limit, skipLength, searchKeyword ?? "")
          : _api.getProductsByCategory(categoryName!, limit, skipLength);
}
