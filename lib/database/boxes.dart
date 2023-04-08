import 'package:flutter/foundation.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'cart/cart.dart';

class Boxes {
  static Box<Cart> getCarts() => Hive.box<Cart>(Cart.tableName);

  static Box<Product> getProducts() => Hive.box<Product>(Product.tableName);
}

initDatabase() async {
  if (kIsWeb) {
    Hive.initFlutter();
  } else {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(ProductAdapter());

  await Hive.openBox<Cart>(Cart.tableName);
  await Hive.openBox<Product>(Product.tableName);
}
