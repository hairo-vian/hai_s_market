import 'package:hai_market/contract/api_contract.dart';
import 'package:hai_market/di/factory/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api.g.dart';

@injectable
@RestApi()
abstract class HomeApi {
  @factoryMethod
  factory HomeApi(Dio dio) = _HomeApi;

  @GET(ApiContract.getCategories)
  Future<List<String>> getCategories();

  @GET(ApiContract.getLatestReleasedProducts)
  Future<Products> getLatestReleasedProduct();
}
