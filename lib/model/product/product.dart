import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hai_market/model/json_model.dart';

part 'product.g.dart';

class Category {
  final String text;
  final String image;

  Category(this.text, this.image);
}

@JsonSerializable()
class Products implements JSONModel{
  List<Product>? products;

  Products({this.products});

  @override
  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  factory Products.fromJson(dynamic json) => _$ProductsFromJson(json);

  List<Product>? get()=> products;
}

@JsonSerializable()
class Product implements JSONModel {
  int? id;
  String? title;
  String? description;
  double? price;
  double? discountPercentage;
  double? rating;
  double? stock;
  String? brand;
  String? category;
  String? thumbnail;
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
