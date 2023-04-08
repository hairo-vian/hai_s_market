import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/ui/cart/datasource/cart_datasource.dart';

import 'package:injectable/injectable.dart';

import '../../model/error/error_model.dart';
import '../../model/state_data/state_data.dart';

class CartState extends StateData {
  final String? sample;

  CartState({this.sample, ErrorModel? error}) : super(error: error);

  @override
  CartState copyWith({String? sample, ErrorModel? error}) => CartState(
        sample: sample ?? this.sample,
        error: error ?? this.error,
      );
}

@injectable
class CartViewModel extends ViewModel<CartState> {
  CartViewModel(this._dataSource);

  final CartDataSource _dataSource;

  @override
  void onChange(Change<CartState> change) {
    super.onChange(change);
    print(change);
  }
}
