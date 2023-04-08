import 'package:dio/dio.dart';
import 'package:hai_market/contract/api_contract.dart';
import 'package:hai_market/ui/login/model/login_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api.g.dart';

@injectable
@RestApi(baseUrl: "https://api.escuelajs.co")
abstract class LoginApi {
  @factoryMethod
  factory LoginApi(Dio dio) = _LoginApi;

  @POST(ApiContract.login)
  Future<LoginResponse> login(@Body() Map<String, String> requestBody);

  @GET(ApiContract.getProfile)
  Future<ProfileResponse> getProfile(@Header("Authorization") String auth);
}
