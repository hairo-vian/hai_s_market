import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/database/boxes.dart';
import 'package:hai_market/database/cart/cart.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/ui/cart/datasource/cart_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../model/error/error_model.dart';
import '../../model/product/product.dart';
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

  void addToCart(Product? product) {
    if (product != null) {
      var existValue = Boxes.getCarts().values.where((element) {
        return element.product!.id == product.id;
      }).toList();
      if (existValue.isEmpty) {
        final newCart = Cart()
          ..cartId = const Uuid().v4()
          ..product = product
          ..amount = 1
          ..userId = _dataSource.userId;

        Boxes.getCarts().add(newCart);
      } else {
        var putCart = existValue[0];
        putCart.amount = putCart.amount! - 1;

        int index = Boxes.getCarts().values.toList().indexOf(existValue[0]);
        Boxes.getCarts().putAt(index, putCart);
      }
    }
  }

  @override
  void onChange(Change<CartState> change) {
    super.onChange(change);
    print(change);
  }
}
