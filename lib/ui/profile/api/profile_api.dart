
import 'package:dio/dio.dart';
import 'package:hai_market/contract/api_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@injectable
@RestApi()
abstract class ProfileApi {
  @factoryMethod
  factory ProfileApi(Dio dio) = _ProfileApi;
}
