import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hai_market/model/json_model.dart';
import 'package:hive/hive.dart';

part 'product.g.dart';

class Category {
  final String text;
  final String image;

  Category(this.text, this.image);
}

@JsonSerializable()
class Products implements JSONModel {
  List<Product>? products;
  int? total;

  Products({this.products, this.total});

  @override
  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  factory Products.fromJson(dynamic json) => _$ProductsFromJson(json);

  List<Product>? get() => products;
}

@HiveType(typeId: 0)
@JsonSerializable()
class Product implements JSONModel {
  static const String tableName = "product";

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  double? price;

  @HiveField(4)
  double? discountPercentage;

  @HiveField(5)
  double? rating;

  @HiveField(6)
  double? stock;

  @HiveField(7)
  String? brand;

  @HiveField(8)
  String? category;

  @HiveField(9)
  String? thumbnail;

  @HiveField(10)
  List<String>? images;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromJson(dynamic json) => _$ProductFromJson(json);
}
