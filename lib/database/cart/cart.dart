import 'package:hai_market/model/product/product.dart';
import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart {
  static const String tableName = "cart";
  @HiveField(0)
  String? cartId;

  @HiveField(1)
  int? userId;

  @HiveField(2)
  Product? product;

  @HiveField(3)
  int? amount;
}
