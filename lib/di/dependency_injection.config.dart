// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../ui/cart/api/cart_api.dart' as _i21;
import '../ui/cart/cart_viewmodel.dart' as _i23;
import '../ui/cart/datasource/cart_datasource.dart' as _i22;
import '../ui/home/api/home_api.dart' as _i4;
import '../ui/home/datasource/home_datasource.dart' as _i5;
import '../ui/home/home_viewmodel.dart' as _i7;
import '../ui/login/api/login_api.dart' as _i8;
import '../ui/login/datasource/login_datasource.dart' as _i9;
import '../ui/login/login_viewmodel.dart' as _i10;
import '../ui/product_detail/api/product_detail_api.dart' as _i11;
import '../ui/product_detail/datasource/product_detail_datasource.dart' as _i12;
import '../ui/product_detail/product_detail_viewmodel.dart' as _i13;
import '../ui/products/api/products_api.dart' as _i14;
import '../ui/products/datasource/products_datasource.dart' as _i15;
import '../ui/products/products_viewmodel.dart' as _i16;
import '../ui/register/api/register_api.dart' as _i17;
import '../ui/register/datasource/register_datasource.dart' as _i18;
import '../ui/register/register_viewmodel.dart' as _i19;
import 'dependency_injection.dart' as _i24;
import 'factory/view_model_factory.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.LoginApi>(() => _i8.LoginApi(get<_i3.Dio>()));
  gh.factory<_i9.LoginDataSource>(() => _i9.LoginDataSource(
        get<_i8.LoginApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i10.LoginViewModel>(
      () => _i10.LoginViewModel(get<_i9.LoginDataSource>()));
  gh.factory<_i11.ProductDetailApi>(
      () => _i11.ProductDetailApi(get<_i3.Dio>()));
  gh.factory<_i12.ProductDetailDataSource>(() => _i12.ProductDetailDataSource(
        get<_i11.ProductDetailApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i13.ProductDetailViewModel>(
      () => _i13.ProductDetailViewModel(get<_i12.ProductDetailDataSource>()));
  gh.factory<_i14.ProductsApi>(() => _i14.ProductsApi(get<_i3.Dio>()));
  gh.factory<_i15.ProductsDataSource>(() => _i15.ProductsDataSource(
        get<_i14.ProductsApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i16.ProductsViewModel>(
      () => _i16.ProductsViewModel(get<_i15.ProductsDataSource>()));
  gh.factory<_i17.RegisterApi>(() => _i17.RegisterApi(get<_i3.Dio>()));
  gh.factory<_i18.RegisterDataSource>(() => _i18.RegisterDataSource(
        get<_i17.RegisterApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i19.RegisterViewModel>(
      () => _i19.RegisterViewModel(get<_i18.RegisterDataSource>()));
  gh.singleton<_i20.ViewModelFactory>(_i20.ViewModelFactoryImpl());
  gh.factory<_i21.CartApi>(() => _i21.CartApi(get<_i3.Dio>()));
  gh.factory<_i22.CartDataSource>(() => _i22.CartDataSource(
        get<_i21.CartApi>(),
        get<_i6.SharedPreferences>(),
      ));
  gh.factory<_i23.CartViewModel>(
      () => _i23.CartViewModel(get<_i22.CartDataSource>()));
  return get;
}

class _$RegisterModule extends _i24.RegisterModule {}
