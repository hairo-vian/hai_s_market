import 'package:dio/dio.dart';
import 'package:hai_market/contract/api_contract.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'products_api.g.dart';

@injectable
@RestApi()
abstract class ProductsApi {
  @factoryMethod
  factory ProductsApi(Dio dio) = _ProductsApi;

  @GET(ApiContract.getAllProducts)
  Future<Products> getAllProducts(@Query("limit") int limit, @Query("skip") int skip, @Query("q") String searchKeyword);

  @GET("${ApiContract.getProductsByCategory}/{categoryName}")
  Future<Products> getProductsByCategory(
      @Path("categoryName") String categoryName, @Query("limit") int limit, @Query("skip") int skip);
}
