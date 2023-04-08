import 'package:dio/dio.dart';
import 'package:hai_market/contract/api_contract.dart';
import 'package:hai_market/ui/register/model/register_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'register_api.g.dart';

@injectable
@RestApi(baseUrl: "https://api.escuelajs.co")
abstract class RegisterApi {
  @factoryMethod
  factory RegisterApi(Dio dio) = _RegisterApi;

  @POST(ApiContract.createUser)
  Future<void> createUser(@Body() RegisterRequest request);
}
