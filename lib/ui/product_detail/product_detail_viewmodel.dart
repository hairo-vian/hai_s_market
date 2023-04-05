import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/model/state_data/state_data.dart';
import 'package:hai_market/ui/product_detail/datasource/product_detail_datasource.dart';

import 'package:injectable/injectable.dart';

class ProductDetailState extends StateData {
  final String? sample;

  ProductDetailState({this.sample, ErrorModel? error}) : super(error: error);

  @override
  ProductDetailState copyWith({String? sample, ErrorModel? error}) => ProductDetailState(
        sample: sample ?? this.sample,
        error: error ?? this.error,
      );
}

@injectable
class ProductDetailViewModel extends ViewModel<ProductDetailState> {
  ProductDetailViewModel(this._dataSource);

  final ProductDetailDataSource _dataSource;

  @override
  void onChange(Change<ProductDetailState> change) {
    super.onChange(change);
    print(change);
  }
}
