// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../ui/home/api/home_api.dart' as _i4;
import '../ui/home/datasource/home_datasource.dart' as _i5;
import '../ui/home/home_viewmodel.dart' as _i7;
import '../ui/product_detail/api/product_detail_api.dart' as _i8;
import '../ui/product_detail/datasource/product_detail_datasource.dart' as _i9;
import '../ui/product_detail/product_detail_viewmodel.dart' as _i10;
import '../ui/products/api/products_api.dart' as _i11;
import '../ui/products/datasource/products_datasource.dart' as _i12;
import '../ui/products/products_viewmodel.dart' as _i13;
import 'dependency_injection.dart' as _i15;
import 'factory/view_model_factory.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(registerModule.dio());
  gh.factory<_i4.HomeApi>(() => _i4.HomeApi(get<_i3.Dio>()));
  gh.factory<_i5.HomeDataSource>(() => _i5.HomeDataSource(
        get<_i4.HomeApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i7.HomeViewModel>(
      () => _i7.HomeViewModel(get<_i5.HomeDataSource>()));
  gh.factory<_i8.ProductDetailApi>(() => _i8.ProductDetailApi(get<_i3.Dio>()));
  gh.factory<_i9.ProductDetailDataSource>(() => _i9.ProductDetailDataSource(
        get<_i8.ProductDetailApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i10.ProductDetailViewModel>(
      () => _i10.ProductDetailViewModel(get<_i9.ProductDetailDataSource>()));
  gh.factory<_i11.ProductsApi>(() => _i11.ProductsApi(get<_i3.Dio>()));
  gh.factory<_i12.ProductsDataSource>(() => _i12.ProductsDataSource(
        get<_i11.ProductsApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i13.ProductsViewModel>(
      () => _i13.ProductsViewModel(get<_i12.ProductsDataSource>()));
  gh.singleton<_i14.ViewModelFactory>(_i14.ViewModelFactoryImpl());
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
