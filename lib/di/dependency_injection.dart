import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hai_market/di/factory/dio_factory.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.I;

@InjectableInit()
Future<void> initializeGetIt() async {
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  $initGetIt(getIt);
}

@module
abstract class RegisterModule {
  @singleton
  Dio dio() => DioFactory().create();
}
