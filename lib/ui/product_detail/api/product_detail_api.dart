
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'product_detail_api.g.dart';

@injectable
@RestApi()
abstract class ProductDetailApi {
  @factoryMethod
  factory ProductDetailApi(Dio dio) = _ProductDetailApi;
}
