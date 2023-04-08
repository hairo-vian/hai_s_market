
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api.g.dart';

@injectable
@RestApi()
abstract class CartApi {
  @factoryMethod
  factory CartApi(Dio dio) = _CartApi;
}
